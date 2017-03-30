{{define "content"}}
<div id="contestinfo">
<h1>{{.Contest}}</h1>
<p>开始时间 : {{ShowTime .Start}} &nbsp;&nbsp;结束时间 : {{ShowTime .End}}</p>
<p>当前时间 : {{ShowTime .Time}}</p>
</div>
<table id="contest_list" class="table table-bordered table-striped table-hover">
  <thead>
    <tr>
      <th class="header">标志</th>
      <th class="header">ID</th>
      <th class="header">标题</th>
      <th class="header">接受/提交</th>
    </tr>
  </thead>
  <tbody>
    {{$cid := .Cid}}
    {{with .Problem}}  
      {{range .}}
      {{if .}} 
            <tr>
              <td>
              {{if ShowACFlag .Flag}} <span class="icon icon-material-check"></span>
              {{else if ShowErrFlag .Flag}}
              <span class="icon icon-material-clear"></span>
              {{end}}
              </td>
              <td>{{.Pid}}</td>
              <td><a href="/contests/{{$cid}}/problems/{{.Pid}}">{{.Title}}</a></td>
              <td>{{ShowRatio .Solve .Submit}} ({{.Solve}}/{{.Submit}})</td>
            </tr>
      {{end}}
      {{end}}  
    {{end}}
  </tbody>
</table>
{{end}}