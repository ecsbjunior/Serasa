function showToast(msg){
    var toast = document.getElementById("snackbar");
    toast.className = "show";
    toast.innerText = msg;
    setTimeout(function(){
        toast.className = toast.className.replace("show", "");
        toast.innerText = "";
    }, 3000);
}

function buildTable(restricts) {
    restricts = JSON.parse(restricts);

    let table = `
        <table class="table table-dark my-4">
            <thead>
                <tr>
                    <th scope="col">Tipo</th>
                    <th scope="col">Valor</th>
                </tr>
            </thead>
            <tbody>
    `
    for(const index in restricts) {
        table += `
                <tr>
                    <td>${restricts[index].type}</td>
                    <td>${restricts[index].value}</td>
                </tr>
        `;
    }
    table += `
            </tbody>
        </table>
    `;

    return table;
}

function handleCpf() {
    event.preventDefault();

    const form = document.getElementById('fCpf');
    const data = new URLSearchParams();
    const URL = 'http://localhost:8084/Serasa-backend/CPFRequest';
    const content = document.getElementById('content');

    for(const pair of new FormData(form)) {
        data.append(pair[0], pair[1]);
    }

    fetch(URL, {method: 'POST', body: data}).then(response => {
        return response.text();
    }).then(result => {
        if(result.startsWith('CPF')) {
            content.innerHTML = "<h5 class='text-center my-5'>CPF não possui restrições</h5>";
            showToast(result);
        }
        else {
            content.innerHTML = buildTable(result);
            showToast("Carregado com sucesso!");
        }
    }).catch(err => {
        console.log(`Erro -> ${err}`);
    });
}