{{define "content"}}
{{$privilege := .Privilege}}
{{$compiler_id := .Compiler_id}}
{{with .Detail}}
  <h1 style="text-align: center" class="page-header">{{.Title}}</h1>
  <div id="problemInfo" class="rfloat" title="Problem Information">
    <div class="limit">
      <div class="key">时间限制</div>
      <div class="value">{{.Time}}s<br></div>
    </div>
    <div class="limit">
      <div class="key">内存限制</div>
      <div class="value">{{.Memory}}KB<br></div>
    </div>
    <div class="checker">
      <div class="key">评判程序</div>
      <div class="value">
        <span>{{ShowSpecial .Special}}</span>
      </div>
    </div>
    <div class="checker">
      <div class="key">解决/提交</div>
      <div class="value">
        <span>{{ShowRatio .Solve .Submit}}(<a href="/status?pid={{.Pid}}&judge=3">{{.Solve}}</a>/<a href="/status?pid={{.Pid}}">{{.Submit}}</a>)</span>
      </div>
    </div>
  </div>
  <div id="problemContent">
    <div class="problemIteam">描述:</div>
    <p>{{.Description}}</p>
    <div class="problemIteam">输入:</div>
    <p>{{.Input}}</p>
    <div class="problemIteam">输出:</div>
    <p>{{.Output}}</p>
    <div class="problemIteam">示例输入:</div>
    <pre class="sample">{{.In}}</pre>
    <div class="problemIteam">示例输出:</div>
    <pre class="sample">{{.Out}}</pre>
    {{if .Hint}}
      <div class="problemIteam">提示:</div>
      <p>{{.Hint}}</p>
    {{end}}
    {{if .Source}}
      <div class="problemIteam">Source:</div>
      <p><a href="/problems?source={{.Source}}">{{.Source}}</a></p>
    {{end}}
  </div>
  <hr>

  <a href="#" id="submission_link" onclick="show_submission(); return false;">提交</a>
  <script src="/static/js/codemirror.js" type="text/javascript"></script>
  <div id="submission" style="display: none;">
  <form accept-charset="UTF-8" id="problem_submit">
    <div style="margin:0;padding:0;display:inline">
      <input name="utf8" type="hidden" value="✓">
    </div>
    <div class="field">
      <label for="compiler_id">编译器</label>
      <select id="compiler_id" name="compiler_id">
        <option value="1" {{if eq $compiler_id "1"}}selected="selected"{{end}}>C</option>
        <option value="2" {{if eq $compiler_id "2"}}selected="selected"{{end}}>C++</option>
        <option value="3" {{if eq $compiler_id "3"}}selected="selected"{{end}}>Java</option>

      </select>
      <font  id="warning" color="red"></font>
    </div>
    <div class="field">
      <div class="rfloat">
        <input checked="checked" id="advanced_editor" name="advanced_editor" onchange="toggle_editor()" onclick="toggle_editor()" type="checkbox" value="1" />
        使用增强编辑器
    </div>     
     <label for="code">代码</label>
      <textarea id="code" name="code" autofocus=""></textarea>
    </div>
    <div class="actions">
      <input name="submit" type="submit" value="提交">
    </div>
  </form>
  </div>

  <script type="text/javascript">
  var editor;
  function show_submission() {
    $('#submission').show();
    $('#submission_link').hide();
    editor = CodeMirror.fromTextArea(document.getElementById("code"), {
      lineNumbers: true,
    }); 
    $('#code').blur(function(){editor.setValue($('#code').val());});
    $('#compiler_id').change(set_mode);
    set_mode();
    toggle_editor();
  };
  $('#problem_submit').submit(function(e) {
    $('#code').val(editor.getValue());
    e.preventDefault();
    $.ajax({
      type:'POST',
      url:'/problems/{{.Pid}}',
      data:$(this).serialize(),
      error: function(XMLHttpRequest) {
        if(XMLHttpRequest.status == 401){
          alert('Please Sign In.');
          window.location.href = '/sess';
        }else {
          var json = eval('('+XMLHttpRequest.responseText+')');
          if(json.info != null) {
            $('#warning').text(json.info);
          } else {
            $('#warning').text('');
          }
        }
      },
      success: function(result) {
        $('textarea').val('')
        window.location.href = '/status';
      }
    });
  });
  function toggle_editor() {
    var cm=$('.CodeMirror'), c=$('#code');
    if($('#advanced_editor').prop('checked')) {
      cm.show();
      editor.setValue(c.val());
      c.hide();
    } else {
      c.val(editor.getValue()).show();
      cm.hide();
    };
    return true;
  }
  function set_mode() {
    var compiler=$('#compiler_id option:selected').text();
    var modes=[ 
    'Javascript', 'Haskell', 'Lua', 'Pascal', 'Python', 'Ruby', 'Scheme', 'Smalltalk', 'Clojure',
    ['PHP', 'text/x-php'],
    ['C', 'text/x-csrc'],
    ['C++', 'text/x-c++src'],
    ['Java', 'text/x-java'],
    ['', 'text/plain'] ];
    for(var i=0;i!=modes.length;++i){
      var n=modes[i], m=modes[i];
      if($.isArray(n)) { m=n[1]; n=n[0]; }
      if(compiler.indexOf(n)>=0){editor.setOption('mode',m.toLowerCase());break;}
    }
  };
  </script>
{{end}}
{{end}}
