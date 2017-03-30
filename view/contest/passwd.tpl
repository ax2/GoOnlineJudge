{{define "content"}}
<h1>{{.Contest}}</h1>
  <div class="flash alert alert-warning" id="signin_failed" style="display:none;">密码错误</div>
<form accept-charset="UTF-8" class="" id="pw_contest" method="post" >
	<div class="field">
    	<label for="password">密码</label><br>
    	<input id="password" name="password" size="20" type="text" />
    </div>
    <div class="actions">
      <input name="commit" type="submit" value="提交">
    </div>
</form>
 <script type="text/javascript">
  $('#pw_contest').submit( function(e) {
    e.preventDefault();
    $.ajax({
      type:'POST',
      url:'/contests/{{.Cid}}/password',
      data:$(this).serialize(),
      error: function() {
        $('#signin_failed').css('display', 'block');
      },
      success: function() {
      	$('#signin_failed').css('display', 'none');
        window.location.href = "/contests/{{.Cid}}";
      }
    });
  });
  </script>
{{end}}