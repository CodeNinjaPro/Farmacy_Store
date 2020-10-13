selectedRowToInput();
function selectedRowToInput() {
    var table = document.getElementById('table'), rIndex;
    for (var i = 1; i < table.rows.length; i++) {
        table.rows[i].onclick = function () {
            rIndex = this.rowIndex;
            document.getElementById("stock_id").value = this.cells[1].textContent;
            document.getElementById("item_registration_id").value = this.cells[2].textContent;
            document.getElementById("qty").value = this.cells[3].textContent;
            document.getElementById("offer_presentage").value = this.cells[4].textContent;
            document.getElementById("date_time").value = this.cells[5].textContent;
        };
    }
}

function save() {
    var stock_id = $('#stock_id').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var offer_presentage = $('#offer_presentage').val();
    var date_time = $('#date_time').val();
    var action = "insert";
    if (stock_id === "" || item_registration_id === "" || qty === "" || offer_presentage === "" || date_time === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'StockServlet',
            method: 'POST',
            data: {action: action, stock_id: stock_id, item_registration_id: item_registration_id, qty: qty, offer_presentage: offer_presentage, date_time: date_time},
            success: function (resultText) {
                alert(resultText);
                $("#table").find("tr:gt(0)").remove();
                load();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function update() {
    var stock_id = $('#stock_id').val();
    var item_registration_id = $('#item_registration_id').val();
    var qty = $('#qty').val();
    var offer_presentage = $('#offer_presentage').val();
    var date_time = $('#date_time').val();
    var action = "update";
    stock_id = parseInt(stock_id);
    if (stock_id === 0) {
        alert("Please Select to Update")
    } else if (stock_id === "" || item_registration_id === "" || qty === "" || offer_presentage === "" || date_time === "") {
        alert("Please Enter All Details")
    } else {
        $.ajax({
            url: 'StockServlet',
            method: 'POST',
            data: {action: action, stock_id: stock_id, item_registration_id: item_registration_id, qty: qty, offer_presentage: offer_presentage, date_time: date_time},
            success: function (resultText) {
                alert(resultText);
                $("#table").find("tr:gt(0)").remove();
                load();
            },
            error: function (jqXHR, exception) {
                alert("Fail Ajax");
            }
        });
    }
}

function delet() {
    var stock_id = $('#stock_id').val();
    var action = "delete";
    stock_id = parseInt(stock_id);
    if (stock_id === 0) {
        alert("Please Select to Update")
    } else {
        var r = confirm("Are you Sure?");
        if (r == true) {
            $.ajax({
                url: 'StockServlet',
                method: 'POST',
                data: {action: action, stock_id: stock_id},
                success: function (resultText) {
                    $("#table").find("tr:gt(0)").remove();
                    load();
                    alert("Deleted")
                },
                error: function (jqXHR, exception) {
                    alert("Fail Ajax");
                }
            });
        } else {
            alert("Not Deleted")
        }
    }
}

function load() {
    var table = document.getElementById('table');
    var dropdown1 = document.getElementById('item_registration_id');
    $('#item_registration_id')
            .find('option')
            .remove()
            .end()
            ;

    var action = "serch";
    $.ajax({
        url: 'Item_registrationServlet',
        method: 'POST',
        data: {action: action},
        success: function (resultText) {


            resultText = resultText.replace("[", "");
            resultText = resultText.replace("]", "");

            var c = [];
            c = resultText;


            if (c.length > 1) {

                var step1 = [];
                var step2 = [];
                step1 = resultText.split("~");

                for (i = 0; i < step1.length; ++i) {
                    step2 = step1[i].split("_");
                    var option = document.createElement("option");
                    option.text = step2[0];
                    dropdown1.add(option);

                }
            }

            onChangeDiscount();

        },
        error: function (jqXHR, exception) {
            swal("fail");
        }
    });
    var action = "serch";
    $.ajax({
        url: 'StockServlet',
        method: 'POST',
        data: {action: action},
        success: function (resultText) {
            resultText = resultText.replace("[", "");
            resultText = resultText.replace("]", "");
            var c = [];
            c = resultText;
            if (c.length > 5) {
                var step1 = [];
                var step2 = [];
                step1 = resultText.split("~");
                for (i = 0; i < step1.length; ++i) {
                    step2 = step1[i].split("_");
                    var newRow = table.insertRow(table.length),
                            cell0 = newRow.insertCell(0),
                            cell1 = newRow.insertCell(1),
                            cell2 = newRow.insertCell(2),
                            cell3 = newRow.insertCell(3),
                            cell4 = newRow.insertCell(4),
                            cell5 = newRow.insertCell(5),
                            cell6 = newRow.insertCell(6),
                            k = i + 1;
                    cell0.innerHTML = k;
                    cell1.innerHTML = step2[0];
                    cell2.innerHTML = step2[1];
                    cell3.innerHTML = step2[2];
                    cell4.innerHTML = step2[3];
                    cell5.innerHTML = step2[4];
                    cell6.innerHTML = step2[5];
                }
            }
            selectedRowToInput();
        },
        error: function (jqXHR, exception) {
            alert("Fail Ajax")
        }
    });
    document.getElementById("form").reset();
}