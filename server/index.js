var paypal = require('paypal-rest-sdk');
const express = require("express");
const app = express();
var bodyParser = require('body-parser')
app.use(
    bodyParser.urlencoded({
    extended:false})
);
app.use(bodyParser.json());
paypal.configure({
    'mode': 'sandbox', //sandbox or live
    'client_id': 'AW4esGjLSGPj8xSCYSvCk8C7Li6KDcToIjm7hhNK6qJtJol35vJT1KEL1sZJPmH14LeWYCiT7RJn0-fi',
    'client_secret': 'EH5Ee75FTBgfMmyTjMWLNvtTGCDIc9u7uqMabZNsJLieB2A9v_VsCvIPb9ptZNjxYBZaZB4uTIAA0qYi'
  });

  var amount =1;

app.use(express.json()); 
const Port =8001;
app.post('/pay',(req,res)=>{
     amount =req.body.price ;
     if(amount==0){
        amount=1;
     }
    var create_payment_json = {
        "intent": "sale",
        "payer": {
            "payment_method": "paypal"
        },
        "redirect_urls": {
            "return_url":'http://10.0.2.2:8001/success',// "http://localhost:8001/success",
            "cancel_url": "http://cancel.url"
        },
        "transactions": [{
            "item_list": {
                "items": [{
                    "name": "item",
                    "sku": "item",
                    "price": amount,
                    "currency": "USD",
                    "quantity": 1
                }]
            },
            "amount": {
                "currency": "USD",
                "total": amount
            },
            "description": "This is the payment description."
        }]
    };
    
    
    paypal.payment.create(create_payment_json, function (error, payment) {
        if (error) {
            throw error;
        } else {
            console.log("Create Payment Response");
            for (var index = 0; index < payment.links.length; index++) {
                //Redirect user to this endpoint for redirect url
                    if (payment.links[index].rel === 'approval_url') {
                       res.redirect(payment.links[index].href);
                    }
                }
            console.log(payment);
        }
    });   
    
}) // http://localhost:8001/success
app.get('/success',(req,res)=>{
  
    console.log(req.query.PayerID);
    console.log(req.query.paymentId);
   
var execute_payment_json = {
    "payer_id": req.query.PayerID,
    "transactions": [{
        "amount": {
            "currency": "USD",
            "total": amount
        }
    }]
};

var paymentId = req.query.paymentId;
 
paypal.payment.execute(paymentId, execute_payment_json, function (error, payment) {
    if (error) {
        console.log(error.response);
        throw error;
    } else {
        console.log("Get Payment Response");
        console.log(JSON.stringify(payment));
        res.redirect('http://10.0.2.2:8001/success2');
    }
}); 

});

app.get('/success2',(req,res)=>{
    res.send({'ss':'sd'});
});
app.listen(8001 ,() => {
  console.log("conected to port " + Port);
});