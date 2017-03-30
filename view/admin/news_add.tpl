{{define "content"}}
<h1>管理 - 新闻添加</h1>
<form accept-charset="UTF-8" class="new_news" id="new_news" method="post" action="/admin/news">
    <div style="margin:0;padding:0;display:inline">
      <input name="utf8" type="hidden" value="✓">
    </div>
    <div class="field">
    	<label for="news_title">标题</label><br>
    	<input id="news_title" name="title" size="60" type="text">
    </div>
    <div class="field">
    	<label for="news_content">内容</label><br>
    	<input id="news_content" name="content" size="60" type="text">
    </div>
    <div class="actions">
      <input name="commit" type="submit" value="提交">
    </div>
</form>
<script>
var options = {
	height: '250px',
	langType : 'en',
	items: [
        'source', '|', 'undo', 'redo', '|', 
        'preview', 'code', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 
        'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 
        'insertorderedlist', 'insertunorderedlist', 'subscript', 'superscript', 
        'clearhtml', '|', 'fullscreen', '/', 'formatblock', 'fontname', 'fontsize', '|', 
        'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 
        'removeformat', '|', 'image', 'table', 'hr', 
        'emoticons', 'baidumap', 'link', 'unlink', '|', 'about'
	]
}

KindEditor.ready(function(K) {
    window.editor = K.create('#news_content', options);
});
</script>
{{end}}
