{{define "content"}}
<h1>管理 - 竞赛编辑</h1>
{{with .Detail}}
<form accept-charset="UTF-8" class="" id="new_contest" method="post" action="/admin/contests/{{.Cid}}">
	<div style="margin:0;padding:0;display:inline">
    	<input name="utf8" type="hidden" value="✓">
    </div>
    <div class="field">
    	<label for="content_title">标题</label><br>
    	<input id="content_title" name="title" size="60" style="width:640px" type="text" value="{{.Title}}">
    </div>
    <div class="field">
    	<label for="content_type" value="Public">C竞赛类型</label><br>
    	<select id="content_type" name="type" onchange="show(); return false;">
    		<option value="public" {{if .IsPublic}}selected{{end}}>公开</option>
    		<option value="private" {{if .IsPrivate}}selected{{end}}>私有</option>
    		<option value="password" {{if .IsPassword}}selected{{end}}>密码</option>
    	</select>
    </div>
    <div class="field" id="passwd_field" {{if not .IsPassword}}style="display: none;"{{end}}>
      <label for="password">密码</label><br>
      <input id="password" name="password" size="20" type="text" {{if .IsPassword}}value="{{.Argument}}"{{end}} />
    </div>
    <div class="field">
      <label for="content_startTimeYear">开始时间[Year-Month-Day Hour:Minute]</label><br>
      <input id="content_startTimeYear" name="startTimeYear" size="4" type="number" max="2100" min="2014" value="{{.StartTimeYear}}">-
      <input id="content_startTimeMonth" name="startTimeMonth" size="4" type="number" max="12" min="1" value="{{.StartTimeMonth}}">-
      <input id="content_startTimeDay" name="startTimeDay" size="4" type="number" max="31" min="1" value="{{.StartTimeDay}}">   
      <input id="content_startTimeHour" name="startTimeHour" size="4" type="number" max="23" min="0" value="{{.StartTimeHour}}">:
      <input id="content_startTimeMinute" name="startTimeMinute" size="4" type="number" max="59" min="0" value="{{.StartTimeMinute}}">:
    </div>
    <div class="field">
      <label for="content_endTimeYear">结束时间[Year-Month-Day Hour:Minute]</label><br>
      <input id="content_endTimeYear" name="endTimeYear" size="4" type="number" max="2100" min="2014" value="{{.EndTimeYear}}">-
      <input id="content_endTimeMonth" name="endTimeMonth" size="4" type="number" max="12" min="1" value="{{.EndTimeMonth}}">-
      <input id="content_endTimeDay" name="endTimeDay" size="4" type="number" max="31" min="1"  value="{{.EndTimeDay}}">   
      <input id="content_endTimeHour" name="endTimeHour" size="4" type="number" max="23" min="0" value="{{.EndTimeHour}}">:
      <input id="content_endTimeMinute" name="endTimeMinute" size="4" type="number" max="59" min="0" value="{{.EndTimeMinute}}">:
    </div>
    <div class="field">
    	<label for="content_problemList">题目列表[题目间用分号(";")分隔]</label><br>
    	<input id="content_problemList" name="problemList" size="100" type="text" style="width:640px" value="{{.ProblemList}}">
    </div>
    <div class="field" id="userlist_field" {{if not .IsPrivate}}style="display: none;"{{end}}>
      <label for="userlist">用户列表</label><br>
      <textarea id="userlist" name="userlist" style="width:630px;height:200px;">{{if .IsPrivate}}{{.Argument}}{{end}}</textarea> 
    </div>
    <div class="actions">
      <input name="commit" type="submit" value="提交">
    </div>
</form>
<script type="text/javascript">
function show() {
    if($('select').val() == "password"){
      $('#userlist_field').hide();
      $('#passwd_field').show();
    }
    else if($('select').val() == "private"){
      $('#userlist_field').show();
      $('#passwd_field').hide();
    }
    else if($('select').val() == "public"){
      $('#userlist_field').hide();
      $('#passwd_field').hide();
    }
  };
  </script>
{{end}}
{{end}}