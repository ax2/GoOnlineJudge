{{define "content"}}
<h1>管理 - 新闻列表</h1>
<table id="news_list">
	<thead>
		<tr>
		    <th class="header">标题</th>
		    <th class="header">日期</th>
		    <th class="header">状态</th>
		    <th class="header">删除</th>
		    <th class="header">编辑</th>
		</tr>
	</thead>
		<tbody>
			{{with .News}}
				{{range .}}
					<tr>
						<td><a href="/news/{{.Nid}}">{{.Title}}</a></td>
						<td>{{.Create}}</td>
						<td><a class="news_status" href="#" data-id="{{.Nid}}">[{{if ShowStatus .Status}}已上线{{else}}已下线{{end}}]</a></td>
						<td><a class="news_delete" href="#" data-id="{{.Nid}}">[删除]</a></td>
						<td><a class="news_edit" href="#" data-id="{{.Nid}}">[编辑]</a></td>
					</tr>
				{{end}}
			{{end}}
		</tbody>
</table>
<script type="text/javascript">
$('.news_status').on('click', function() {
	var nid = $(this).data('id');
	$.ajax({
		type:'POST',
		url:'/admin/news/'+nid+'/status',
		data:$(this).serialize(),
		error: function() {
			alert('failed!');
		},
		success: function() {
			window.location.reload();
		}
	});
});
$('.news_delete').on('click', function() {
	var ret = confirm('Delete the News?');
	if(ret == true) {
		var nid = $(this).data('id');
		$.ajax({
			type:'DELETE',
			url:'/admin/news/'+nid,
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
$('.news_edit').on('click', function() {
	var nid = $(this).data('id');
	window.location.href = '/admin/news/'+nid;
});
</script>

{{end}}