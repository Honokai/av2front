"use strict";

window.addEventListener('load', function () {
  if (document.getElementById('idusuario') != null) {
    var disciplinausuario = new XMLHttpRequest();
    disciplinausuario.open("GET", "http://localhost:8080/av2front/disciplina/recuperaalunousuario.jsp?usuario=" + document.getElementById('idusuario').value);
    disciplinausuario.send();
    disciplinausuario.addEventListener('load', function () {
      var resposta = JSON.parse(disciplinausuario.responseText);

      if (resposta.length > 0) {
        document.getElementById('alunonotas').className = 'card';
        document.getElementById('alunonotas').innerHTML = "";
        insereNotas(document.getElementById('alunonotas'), resposta);
      } else {
        document.getElementById('alunonotas').innerHTML = "\n                <div class=\"row\">\n                    <div class=\"col-12 titulo-header\">N\xE3o h\xE1 registro para o aluno informado.</div>\n                </div>\n                ";
        document.getElementById('alunonotas').className = 'card';
      }
    });
  }

  if (document.getElementById('selectaluno') != null) {
    var aluno = new XMLHttpRequest();
    var selectaluno = document.getElementById('selectaluno');
    aluno.open("GET", "http://localhost:8080/av2front/aluno/todos.jsp");
    aluno.send();
    aluno.addEventListener('load', function () {
      var resposta = JSON.parse(aluno.responseText);

      for (var index = 0; index < resposta.length; index++) {
        var elemento = document.createElement('option');
        elemento.value = resposta[index].id;
        elemento.innerHTML = '' + resposta[index].aluno + '';
        selectaluno.add(elemento);
      }
    });
    document.getElementById('formulario').addEventListener('submit', function (event) {
      event.preventDefault();
      var request = new XMLHttpRequest();
      request.open("GET", "http://localhost:8080/av2front/disciplina/recuperaum.jsp?aluno=" + document.getElementById('selectaluno').value);
      request.send();
      request.addEventListener('load', function () {
        var resposta = JSON.parse(request.responseText);

        if (resposta.length > 0) {
          document.getElementById('notas').className = 'card';
          document.getElementById('notas').innerHTML = "";
          insereNotas(document.getElementById('notas'), resposta);
        } else {
          document.getElementById('notas').innerHTML = "\n                    <div class=\"row\">\n                        <div class=\"col-12 titulo-header\">N\xE3o h\xE1 registro para o aluno informado.</div>\n                    </div>\n                    ";
          document.getElementById('notas').className = 'card';
        }
      });
    });
  }
});

function insereNotas(div) {
  var array = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
  div.innerHTML += "<div class=\"row\">\n            <div class=\"col-3 titulo-header\">Aluno</div>\n            <div class=\"col-2 titulo-header\">Professor</div>\n            <div class=\"col-2 titulo-header\">Disciplina</div>\n            <div class=\"col-1 titulo-header\">Av1</div>\n            <div class=\"col-1 titulo-header\">Av2</div>\n            <div class=\"col-1 titulo-header\">Av3</div>\n            <div class=\"col-1 titulo-header\">Aps1</div>\n            <div class=\"col-1 titulo-header\">Aps2</div>\n        </div>";

  for (var index = 0; index < array.length; index++) {
    div.innerHTML += "<div class=\"row\">\n            <div class=\"col-3\">".concat(array[index].aluno, "</div>\n            <div class=\"col-2\">").concat(array[index].professor, "</div>\n            <div class=\"col-2\">").concat(array[index].disciplina, "</div>\n            <div class=\"col-1\">").concat(array[index].av1, " </div>\n            <div class=\"col-1\">").concat(array[index].av2, "</div>\n            <div class=\"col-1\">").concat(array[index].av3, "</div>\n            <div class=\"col-1\">").concat(array[index].aps1, " </div>\n            <div class=\"col-1\">").concat(array[index].aps2, " </div>\n        </div>\n        ");
  }
}