{{define "content"}}
<h1>管理 - 消息</h1>
<form accept-charset="UTF-8" class="new_news" id="msg_form" method="post" action="/admin/notice">
 	<div class="field">
    	<label for="title">标题</label><br>
    	<input id="msg" name="msg" size="60" type="text" value="{{.Msg}}">
    </div>
    <div class="actions">
      <input name="commit" type="submit" value="提交">
    </div>
</form>
{{end}}