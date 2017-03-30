{{define "content"}}
<h1>管理 - 竞赛列表</h1>
<table id="contest_list">
  <thead>
    <tr>
      <th class="header">ID</th>
      <th class="header">标题</th>
      <th class="header">作者</th>
      <th class="header">状态</th>
      <th class="header">删除</th>
      <th class="header">编辑</th>
    </tr>
  </thead>
  <tbody>
    {{with .Contest}}  
      {{range .}} 
        <tr>
          <td>{{.Cid}}</td>
          <td><a href="/contests/{{.Cid}}">{{.Title}}</a></td>
          <td><a href="/users/{{.Creator}}">{{.Creator}}</a></td>
          <td><a class="contest_status" href="#" data-id="{{.Cid}}">[{{if ShowStatus .Status}}已上线{{else}}已下线{{end}}]</a></td>
          <td><a class="contest_delete" href="#" data-id="{{.Cid}}">[删除]</a></td>
          <td><a class="contest_edit" href="#" data-id="{{.Cid}}">[编辑]</a></td>
        </tr>
      {{end}}  
    {{end}}
  </tbody>
</table>
<script type="text/javascript">
$('.contest_status').on('click', function() {
  var cid = $(this).data('id');
  $.ajax({
    type:'POST',
    url:'/admin/contests/'+cid+'/status',
    data:$(this).serialize(),
    error: function(){
      alert('failed!');
    },
    success: function(){
      window.location.reload();
    }
  });
});
$('.contest_delete').on('click', function() {
  var ret = confirm('Delete the contest?');
  if (ret == true) {
    var cid = $(this).data('id');
    $.ajax({
      type:'DELETE',
      url:'/admin/contests/'+cid,
      data:$(this).serialize(),
      error: function() {
        alert('failed!');
      },
      success: function() {
        window.location.reload();
      }
    });
  }
});
$('.contest_edit').on('click', function() {
  var cid = $(this).data('id');
  window.location.href = '/admin/contests/'+cid;
});
</script>
{{end}}
