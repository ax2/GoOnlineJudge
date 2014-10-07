package contest

import (
	"GoOnlineJudge/class"
	"GoOnlineJudge/config"
	"net/http"
	"strconv"
	"strings"
	"time"
)

type ContestUserContorller struct {
	Contest
}

var RouterMap = map[string]class.Router{
	"problem":        ProblemController{},
	"status":         StatusController{},
	"ranklist":       RanklistController{},
	"exportranklist": ExportController{},
}

func (this ContestUserContorller) Route(w http.ResponseWriter, r *http.Request) {
	class.Logger.Debug("Contest User")
	this.InitContest(w, r)

	if this.Privilege < config.PrivilegeTC {
		if time.Now().Unix() < this.ContestDetail.Start || this.ContestDetail.Status == config.StatusReverse {
			info := "The contest has not started yet"
			if this.ContestDetail.Status == config.StatusReverse {
				info = "No such contest"
			}
			this.Err400(w, r, "Contest Detail "+strconv.Itoa(this.Cid), info)
			return
		} else if this.ContestDetail.Encrypt == config.EncryptPW {
			if this.Uid == "" {
				http.Redirect(w, r, "/user/signin", http.StatusFound)
				return
			} else if this.GetSession(w, r, strconv.Itoa(this.Cid)) != this.ContestDetail.Argument.(string) {
				this.Password(w, r)
				return
			}
		} else if this.ContestDetail.Encrypt == config.EncryptPT {
			if this.Uid == "" {
				http.Redirect(w, r, "/user/signin", http.StatusFound)
				return
			} else {
				userlist := strings.Split(this.ContestDetail.Argument.(string), "\n")
				flag := false
				for _, user := range userlist {
					if user == this.Uid {
						flag = true
						break
					}
				}
				if flag == false {
					this.Err400(w, r, this.ContestDetail.Title,
						"Sorry, the contest is private and you are not granted to participate in the contest.")
					return
				}
			}
		}
	}

	action := this.GetAction(r.URL.Path, 1)
	class.Logger.Debug(action)
	if v, ok := RouterMap[action]; ok {
		v.Route(w, r)
	} else {
		http.Error(w, "no such page", 404)
	}
}

func (this *ContestUserContorller) Password(w http.ResponseWriter, r *http.Request) {
	if r.Method == "GET" {
		this.Execute(w, "view/layout.tpl", "view/contest/passwd.tpl")
	} else if r.Method == "POST" {
		passwd := r.FormValue("password")
		if passwd == this.ContestDetail.Argument.(string) {
			this.SetSession(w, r, strconv.Itoa(this.Cid), passwd)
			w.WriteHeader(200)
		} else {
			http.Error(w, "incorrect password", 400)
		}
	}
}
