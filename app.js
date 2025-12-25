var express = require('express');
var app = express();
var session = require('express-session');
var conn = require('./dbConfig');
app.set('view engine','ejs');
app.use(session({
    secret: 'yoursecret',
    resave: true,
    saveUninitialized: true
}));
app.use('/public', express.static('public'));

app.use(express.json());
app.use(express.urlencoded({ extended: true}));


app.get('/', function (req, res){
    res.render("home");
    });
app.get('/login', function(req, res) {
    res.render("login.ejs");
});
app.post('/auth', function(req,res){
    let name = req.body.username;
    let password = req.body.password;
    if(name && password) {
        conn.query('SELECT * FROM users WHERE name = ? AND password = ?', [name, password],
        function(error, results, fields) {
                if(error) throw error;
                if(results.length > 0) {
                    req.session.loggedin = true;
                    req.session.username = name;
                    res.redirect('/membersOnly');
                } else{
                    res.send('Incorrect Username and/or Password!');
                }
                res.end();
        });
    }else {
        res.send('Please enter Username and Password!');
        res.end();
    }
});


// users can access this if they are logged in
app.get('/membersOnly', function(req, res, next) {
    if(req.session.loggedin){
        res.render('membersOnly');
    }
    else {
        res.send('Please login to view this page!');
    }
});
//users can access this only if they are logged in
app.get('/addCustomers', function (req, res, next) {
    if (req.session.loggedin) {
        res.render('addCustomers');
    }
    else {
        res.send('Please login to view this page!');
    }
});
app.get('/addPlace', function (req, res, next) {
    if (req.session.loggedin) {
        res.render('addPlace');
    }
    else {
        res.send('Please login to view this page!');
    }
});

app.get('/addReactions', function (req, res, next) {
    if (req.session.loggedin) {
        res.render('addReactions');
    }
    else {
        res.send('Please login to view this page!');
    }
});
//<----! this is to send the data to the database--->
app.post('/addCustomers', function(req, res, next) {
    let CustomerID = req.body.id;
    let name = req.body.name;
    let neighbourhood = req.body.neighbourhood;
    let pic = req.body.pic;
    //var sql = `INSERT INTO mps (id, name, party) VALUES ("${id}", "${name}", "${party}")`;
   // let sql = `INSERT INTO Customer (CustomerID, name, neighbourhood, pic) VALUES ("${CustomerID}", "${name}", "${neighbourhood}","${pic}")`;
    //conn.query(sql, function(err, result) {--->
        let sql = "INSERT INTO Customer (CustomerID, name, neighbourhood, pic) VALUES (?, ?, ?, ?)";
        conn.query(sql, [CustomerID, name, neighbourhood, pic], function(err, result) {
   
        if (err) throw err;
        console.log('record inserted');
        res.render('addCustomers');
    });
});

app.post('/addPlace', function(req, res, next) {
    let placeID = req.body.id;
    let name = req.body.name;
    let reason = req.body.reason;
    //var sql = `INSERT INTO mps (id, name, party) VALUES ("${id}", "${name}", "${party}")`;
    let sql = `INSERT INTO Places (placeID, name, reason) VALUES ("${placeID}", "${name}", "${reason}")`;
    conn.query(sql, function(err, result) {
        if (err) throw err;
        console.log('record inserted');
        res.render('addPlace');
    });
});
app.post('/addReactions', function(req, res, next) {
    let likeID = req.body.likeID;
    let placeName = req.body.placeName;
    let reaction = req.body.reaction;
    //var sql = `INSERT INTO mps (id, name, party) VALUES ("${id}", "${name}", "${party}")`;
    let sql = `INSERT INTO reactions (likeID, placeName, reaction) VALUES ("${likeID}","${placeName}", "${reaction}")`;
    conn.query(sql, function(err, result) {
        if (err) throw err;
        console.log('record inserted');
        res.render('addReactions');
    });
});


app.get('/listCustomers', function (req, res){
    conn.query("SELECT * FROM Customer", function (err, result) {
        if (err) throw err;
        console.log(result);
        res.render('listCustomers', { title: 'List of Customers', CustomerData: result});
    });
});
app.get('/listPlace', function (req, res){
    conn.query("SELECT * FROM places", function (err, result) {
        if (err) throw err;
        console.log(result);
        res.render('listPlace', { title: 'List of Places', PlaceData: result});
    });
});
app.get('/listReaction', function (req, res){
    conn.query("SELECT * FROM reactions", function (err, result) {
        if (err) throw err;
        console.log(result);
        res.render('listReaction', { title: 'List of Reactions', ReactionData: result});
    });
});
app.get('/auckland', function(req, res){
    res.render("auckland");
});
app.get('/beaches', function(req, res){
    res.render("beaches");
});
app.get('/logout',(req,res) => {
    req.session.destroy();
    res.redirect('/');
});
app.listen(3000);
console.log('Node app is running on port 3000');
