const mysql = require("mysql");
const inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 8889,
  user: "root",
  password: "root",
  database: "bamazon"
});

var makeTable = function() {

  connection.query("SELECT * FROM products", function(err, res) {
    if (err) {
      throw err;
    }

    var tab = "\t";
    console.log("ItemID\tProduct Name\tDepartment Name\tPrice\t# In Stock");
    console.log("--------------------------------------------------------");

    for (var i = 0; i < res.length; i++) {
      console.log(res[i].ItemID + tab + res[i].ProductName + tab + res[i].DepartmentName +
        tab + res[i].Price + tab + res[i].StockQuantity
      );
    }
    console.log("--------------------------------------------------------");

    promptManager(res);
  });
};

function addItem() {
  inquirer.prompt([
    {
      type: "input",
      name: "productName",
      message: "What is the name of the product?"
    }, {
      type: "input",
      name: "department",
      message: "What department does it fit into?"
    }, {
      type: "input",
      name: "price",
      message: "What is the price of the item?"
    }, {
      type: "input",
      name: "quantity",
      message: "How many of the item are available?"
    }
  ]).then(function(val) {
    connection.query("INSERT INTO products (product_name, department_name, price, stock_quantity) VALUES ('" +
    val.productName + "','" + val.department + "'," + val.price + "," + val.quantity + ");",
    function(err, res) {
      if (err) {
        throw err;
      }
      console.log("Item added to Bamazon!");
      makeTable();
    });
  });
}
