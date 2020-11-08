window.addEventListener('load', () => {
    document.getElementById('formulario').addEventListener('submit', function(event) {
        if(event.submitter.id == 'apagar') {
            let resposta = excluir()
            if(resposta == false) {
                event.preventDefault()
                Swal.fire({
                    title: 'Eita!',
                    html: 'Verifique os campos <strong>Aluno, Disciplina e Professor</strong> eles são necessários.',
                    icon: 'error',
                    confirmButtonText: 'Verificar'
                })
            }
        } else {
            let resposta = submit()
            if(resposta == false) {
                event.preventDefault()
                Swal.fire({
                    title: 'Eita!',
                    text: 'Parece que algum campo necessário está vazio, verifique e tente novamente',
                    icon: 'error',
                    confirmButtonText: 'Verificar'
                })
            }
        }
    })
    let aluno = new XMLHttpRequest()
    var selectaluno = document.getElementById('selectaluno')
    aluno.open("GET","http://localhost:8080/av2front/aluno/todos.jsp")
    aluno.send()
    aluno.addEventListener('load', () => {
        let resposta = JSON.parse(aluno.responseText)
        for (let index = 0; index < resposta.length; index++) {
            let elemento = document.createElement('option')
            elemento.value = resposta[index].id
            elemento.innerHTML = ''+resposta[index].aluno+''
            selectaluno.add(elemento)
        }
    })
    selectaluno.addEventListener('change', () => {
        limparOpcoes(2)
        let selectdisciplina = document.getElementById('disciplina')
        let copiaSelect = document.getElementById('id_disciplina')
        let disciplina = new XMLHttpRequest()
        if(document.getElementById('acao').value == "adicionar"){
            disciplina.open("GET","http://localhost:8080/av2front/materia/todas.jsp")
        } else {
            disciplina.open("GET","http://localhost:8080/av2front/materia/aluno.jsp?aluno_id="+document.getElementById("selectaluno").value)    
        }
        disciplina.send()
        disciplina.addEventListener('load', () => {
            let resposta = JSON.parse(disciplina.responseText)
            for (let index = 0; index < resposta.length; index++) {
                let elemento = document.createElement('option')
                elemento.value = resposta[index].nome
                elemento.innerHTML = ''+resposta[index].nome+''
                selectdisciplina.add(elemento)
                if(document.getElementById('acao').value == "atualizar") {
                    let selectCopia = document.createElement('option')
                    selectCopia.value = resposta[index].id
                    selectCopia.innerHTML = ''+resposta[index].nome+''
                    copiaSelect.add(selectCopia)
                }
            }
        })
    })
    document.getElementById('disciplina').addEventListener("change", () => {
        if(document.getElementById('acao').value == "atualizar") {
            for(let i = 0; i < document.getElementById('disciplina').length; i++){
                if(document.getElementById('disciplina').value == document.getElementById('id_disciplina').options[i].text &&  document.getElementById('disciplina').selectedIndex == i){
                    document.getElementById('id_disciplina').selectedIndex = i
                }
            }
        }
        limparOpcoes(1)
        let selectprofessor = document.getElementById('professor')
        let professor = new XMLHttpRequest()
        if(document.getElementById("acao").value == "adicionar"){
            professor.open("GET", "http://localhost:8080/av2front/professor/todos.jsp")
        } else {
            professor.open("GET","http://localhost:8080/av2front/professor/materia/aluno.jsp?aluno_id="+
            document.getElementById('selectaluno').value+"&disciplina="+document.getElementById('disciplina').value)    
        }
        professor.send()
        professor.addEventListener('load', () => {
            let resposta = JSON.parse(professor.responseText)
            for (let index = 0; index < resposta.length; index++) {
                let elemento = document.createElement('option')
                elemento.value = resposta[index].id
                elemento.innerHTML = ''+resposta[index].professor+''
                selectprofessor.add(elemento)
            }
        })

    })
    document.getElementById('professor').addEventListener("change", () => {
        
        if(document.getElementById('acao').value == "atualizar"){
            let notas = new XMLHttpRequest()
            notas.open("GET","http://localhost:8080/av2front/aluno/nota.jsp?aluno_id="+
                    document.getElementById('selectaluno').value+"&id_disciplina="+document.getElementById('id_disciplina').value
            +"&professor_id="+document.getElementById('professor').value)
            notas.send()
            notas.addEventListener('load', () => {
                let resposta = JSON.parse(notas.responseText)
                document.getElementById("av1").value = resposta[0].av1
                document.getElementById("av2").value = resposta[0].av2
                document.getElementById("av3").value = resposta[0].av3
                document.getElementById("aps1").value = resposta[0].aps1
                document.getElementById("aps2").value = resposta[0].aps2
            })
        }
        
        
        
    })

})

function submit(){
    let selectaluno = document.getElementById('selectaluno').value
    let selectdisciplina = document.getElementById('disciplina').value
    let professor = document.getElementById('professor').value
    let selectacao = document.getElementById('acao').value
    let av1 = document.getElementById('av1').value
    let av2 = document.getElementById('av2').value
    let av3 = document.getElementById('av3').value
    let aps1 = document.getElementById('aps1').value
    let aps2 = document.getElementById('aps2').value
    

    if((selectacao && selectaluno && av1 && av2 && av3 && aps1 && aps2 && selectdisciplina && professor) != '') {
        if(selectacao == "adicionar"){
            document.getElementById('formulario').setAttribute('action','http://localhost:8080/av2front/disciplina/criar.jsp')
        } else {
            document.getElementById('formulario').setAttribute('action','http://localhost:8080/av2front/disciplina/atualizar.jsp')
        }
        return true
    } else {
        return false
    }
}

function excluir(){
    let selectaluno = document.getElementById('selectaluno').value
    let selectdisciplina = document.getElementById('disciplina').value
    let professor = document.getElementById('professor').value
    let acao = document.getElementById('acao').value
    if((selectaluno && selectdisciplina && professor && acao) != '') {
        document.getElementById('formulario').setAttribute('action','http://localhost:8080/av2front/disciplina/excluir.jsp')
        return true
    } else {
        return false
    }
}

function limparOpcoes(campos) {
    if(campos == 2) {
        var select = document.getElementById("disciplina");
        var length = select.options.length;
        for (let i = length-1; i >= 0; i--) {
            if(select.options[i].value == ""){}
            else {
                select.options[i] = null;
            }
        }
        select = document.getElementById("id_disciplina");
        length = select.options.length;
        for (let i = length-1; i >= 0; i--) {
            if(select.options[i].value == ""){}
            else {
                select.options[i] = null;
            }
        }
        select = document.getElementById("professor");
        length = select.options.length;
        for (let i = length-1; i >= 0; i--) {
            if(select.options[i].value == ""){}
            else {
                select.options[i] = null;
            }
        }
    } else {
        var select = document.getElementById("professor");
        var length = select.options.length;
        for (let i = length-1; i >= 0; i--) {
            if(select.options[i].value == ""){}
            else {
                select.options[i] = null;
            }
        }
    }
}