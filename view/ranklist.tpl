{{define "content"}}
<!-- <h1>Ranklist</h1> -->
<div class="pagination">
  {{$current := .CurrentPage}}
  {{$url := .URL}}
  {{if .IsPreviousPage}}
  <a href="{{$url}}page={{NumSub .CurrentPage 1}}" class="icon icon-material-arrow-back"></a>
  {{else}}
  <span class="icon icon-material-arrow-back"></span>
  {{end}}
  &nbsp;
  {{if .IsPageHead}}
    {{with .PageHeadList}}
      {{range .}}
        {{if eq . $current}}
          <span>{{.}}</span>
        {{else}}
          <a href="{{$url}}page={{.}}">{{.}}</a>
        {{end}}
      {{end}}
    {{end}}
  {{end}}

  {{if .IsPageMid}}
  ...
    {{with .PageMidList}}
      {{range .}}
        {{if eq . $current}}
          <span>{{.}}</span>
        {{else}}
          <a href="{{$url}}page={{.}}">{{.}}</a>
        {{end}}
      {{end}}
    {{end}}
  {{end}}

  {{if .IsPageTail}}
  ...
    {{with .PageTailList}}
      {{range .}}
        {{if eq . $current}}
          <span>{{.}}</span>
        {{else}}
          <a href="{{$url}}page={{.}}">{{.}}</a>
        {{end}}
      {{end}}
    {{end}}
  {{end}}
  &nbsp;
  {{if .IsNextPage}}
  <a href="{{$url}}page={{NumAdd .CurrentPage 1}}" class="icon icon-material-arrow-forward"></a>
  {{else}}
  <span class="icon icon-material-arrow-forward"></span>
  {{end}}
</div>
<div class="table-responsive">
  <table id="ranklist" class="table table-bordered table-striped table-hover">
    <thead>
      <tr>
        <th class="header">排名</th>
        <th class="header">用户</th>
        <th class="header">昵称</th>
        <th class="header">口号</th>
        <th class="header">解决/提交</th>
      </tr>
    </thead>
    <tbody>
      {{with .User}}
        {{range .}}
          {{if ShowStatus .Status}}
            <tr>
              <td>{{.Index}}</td>
              <td><a href="/users/{{.Uid}}">{{.Uid}}</a></td>
              <td>{{.Nick}}</td>
              <td id="motto" >{{.Motto}}</td>
              <td>{{ShowRatio .Solve .Submit}} (<a href="/status?uid={{.Uid}}&judge=3">{{.Solve}}</a>/<a href="/status?uid={{.Uid}}">{{.Submit}}</a>)</td>
            </tr>
          {{end}}
        {{end}}  
      {{end}}
    </tbody>
  </table>
 </div>
{{end}}