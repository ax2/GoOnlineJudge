{{define "content"}}
{{$cid := .Cid}}
<h1 style="text-align:center">竞赛排名 -- {{.Contest}}</h1>
<h5><a href="/contests/{{.Cid}}/rankfile">导出排名</a></h5>
<div style="overflow:scroll; overflow-y:hidden;">
<table id="contest_list" class="table table-bordered table-striped table-hover">
  <thead>
    <tr>
      <th class="header">排名</th>
      <th class="header">团队</th>
      <th class="header">已解决</th>
      <th class="header">罚时</th>
      {{with .ProblemList}}
      {{range $idx,$pid:= .}}
      <th class="header"><a href="/contests/{{$cid}}/problems/{{$idx}}">{{$idx}}</a></th>
      {{end}}
      {{end}}
    </tr>
  </thead>
  <tbody>
    {{with .UserList}}
      {{range $idx,$v := .}} 
          <tr>
            <td>{{NumAdd $idx 1}}</td>
            <td><a href="/users/{{$v.Uid}}">{{$v.Uid}}</a></td>
            <td><a href="/contests/{{$cid}}/status?uid={{$v.Uid}}&judge=3">{{$v.Solved}}</a></td>
            <td>{{ShowGapTime $v.Time}}</td>
            {{with $v.ProblemList}}
            {{range .}}
            {{if .}}
              {{if eq .Judge 3}}<td id="ac"> {{ShowGapTime .Time}}/({{.Count}})</td>
              {{else}}<td>0/({{.Count}})</td>
              {{end}}
            {{else}}<td>0/(0){{end}}</td>
            {{end}}
            {{end}}
          </tr>
      {{end}}  
    {{end}}
  </tbody>
</table>
</div>
{{end}}