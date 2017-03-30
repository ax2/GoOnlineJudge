{{define "content"}}
<!-- <h1>Contest List</h1> -->

<table id="contest_list" class="table table-bordered table-striped table-hover">
  <thead>
    <tr>
      <th class="header">ID</th>
      <th class="header">标题</th>
      <th class="header">状态</th>
      <th class="header">类型</th>
    </tr>
  </thead>
  <tbody>
    {{$time := .Time}}
    {{$privilege := .Privilege}}
    {{with .Contest}}
      {{range .}} 
        {{if or (ShowStatus .Status) (LargePU $privilege)}}
          <tr>
            <td>{{.Cid}}</td>
            <td><a href="/contests/{{.Cid}}">{{.Title}}</a></td>
            <td>{{if ge $time .End }}<font color="green">Ended@{{ShowTime .End}}</font>{{else}}{{if ge .Start $time}}<font color="blue">Start@{{ShowTime .Start}}</font>{{else}}<font color="red">Running</font>{{end}}{{end}}</td>
            <td>{{ShowEncrypt .Encrypt}}</td>
          </tr>
        {{end}}
      {{end}}  
    {{end}}
  </tbody>
</table>
{{end}}
