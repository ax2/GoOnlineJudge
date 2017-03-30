<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="ico" href="/static/favicon.ico" mce_href="/static/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/static/favicon.ico" mce_href="/static/favicon.ico" type="image/x-icon">
    <title>{{.Title}}</title>
    <link href="/static/css/style.css" rel="stylesheet" type="text/css" />
   
    <script src="/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="/static/js/action.js" type="text/javascript"></script>
    {{if .IsEdit}}
      <script src="/static/kindeditor/kindeditor-min.js" type="text/javascript"></script>
      <script src="/static/kindeditor/lang/en.js" type="text/javascript"></script>
    {{end}}
  </head>
  <body>
    <div class="container">
      <div id="pageHeader">
        <div id="logo" class="lfloat">
          <a href="/"><img alt="Logo" src="/static/img/logo.png" /></a>
        </div>
        <div id="headerInfo" class="rfloat">
          {{if .IsCurrentUser}}
            <a href="/settings">[{{.CurrentUser}}]</a>
            <a class="user_signout" href="#">[登出]</a>
          {{end}}
        </div>
        <hr> 
        </div>
        <div id="navibar" class="span-3">
        <ul>
          <li>{{if .IsHome}}<span>首页</span>{{else}}<a href="/admin">首页</a>{{end}}</li>
          {{if .IsAdmin}}
          <li>{{if .IsNotice}}<span>消息</span>{{else}}<a href="/admin/notice">消息</a>{{end}}</li>
          <li><a href="/admin/news">新闻</a></li>
          {{if .IsNews}}
            <div id="psnavi">
              <ul>
                <li>{{if .IsList}}<span>列表</sapn>{{else}}<a href="/admin/news">列表</a>{{end}}</li>
                <li>{{if .IsAdd}}<span>添加</sapn>{{else}}<a href="/admin/news/new">添加</a>{{end}}</li>
              </ul>
            </div>
          {{end}}
          {{end}}
          <li><a href="/admin/problems">题目</a></li>
          {{if .IsProblem}}
            <div id="psnavi">
              <ul>
                <li>{{if .IsList}}<span>列表</sapn>{{else}}<a href="/admin/problems">列表</a>{{end}}</li>
                {{if .IsAdmin}}
                <li>{{if .IsAdd}}<span>添加</sapn>{{else}}<a href="/admin/problems/new">添加</a>{{end}}</li>
                <li>{{if .IsImport}}<span>导入</sapn>{{else}}<a href="/admin/problems/importor">导入</a>{{end}}</li>
                {{end}}
                {{if .RejudgePrivilege}}
                <li>{{if .IsRejudge}}<span>重判</span>{{else}}<a href="/admin/rejudger">重判</a>{{end}}</li>
                {{end}}
              </ul>
            </div>
          {{end}}
          <li><a href="/admin/contests/">竞赛</a></li>
          {{if .IsContest}}
            <div id="psnavi">
              <ul>
                <li>{{if .IsList}}<span>列表</sapn>{{else}}<a href="/admin/contests/">列表</a>{{end}}</li>
                <li>{{if .IsAdd}}<span>添加</sapn>{{else}}<a href="/admin/contests/new">添加</a>{{end}}</li>
              </ul>
            </div>
          {{end}}
          {{if .IsAdmin }}
          <li><a href="/admin/users">用户</a></li>
          {{if .IsUser}}
            <div id="psnavi">
              <ul>
                <li>{{if .IsList}}<span>权限</sapn>{{else}}<a href="/admin/users">权限</a>{{end}}</li>
                <li>{{if .IsPwd}}<span>密码</sapn>{{else}}<a href="/admin/users/pagepassword">密码</a>{{end}}</li>
                <li>{{if .IsGenerate}}<span>生成</sapn>{{else}}<a href="/admin/users/generation">生成</a>{{end}}</li>
              </ul>
            </div>
            {{end}}
          {{end}}
        </ul>
      </div>
      <div id="body" class="span-22 last">
        {{template "content" .}}
      </div>
      <div id="pageFooter" class="center">
        <hr class="nomarginbottom">
        <div id="footerContainer">
         <div class="center">ZJGSU Online Judge Version 15.09.24 @ <a href="https://github.com/ZJGSU-Open-Source/GoOnlineJudge" target="_blank">Github</a></div>
          <div class="center">Copyright &copy; 2013-2015 ZJGSU ACM Club</div>
          <div class="center">Developer: <a href="https://github.com/memelee" target="_blank">@memelee</a> <a href="https://github.com/sakeven" target="_blank">@sakeven</a> <a href="https://github.com/JinweiClarkChao" target="_blank">@JinweiClarkChao</a> <a href="https://github.com/rex-zsd" target="_blank">@rex-zsd</a></div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    $('.user_signout').on('click', function(e) {
      e.preventDefault();
      $.ajax({
        type:'DELETE',
        url:'/sess',
        data:$(this).serialize(),
        error: function() {
          alert('Sign Out Failed.');
        },
        success: function() {
          window.location.href = '/sess';
        }
      });
    });
    </script>
  </body>
</html>

