 # send free whatsapp message using an unofficial whatsapp api
 
 #Whapi.io is in no way affiliated with, authorized, maintained, sponsored or endorsed by WhatsApp or any of its affiliates or subsidiaries. This is #an independent and unofficial software. Do not use this service to send spam or bulk messages. Use at your own risk.
  
  install.packages("httr")
  require("httr")
  install.packages("jsonlite")
  require("jsonlite")
  
  #create a free account and register on https://whapi.io/
  
  url <-"https://whapi.io/api/send"  
  epoch <- as.numeric(Sys.time())
  
  message1 <- "Hello, Good Morning!"
  
  phone_nos <- data.frame(phones=c("91XXXXXXXXXX","91XXXXXXXXXX"))
  
  for(sim_nos in 1:nrow(phone_nos)){
    
    number1 <- as.character(phone_nos$phones[sim_nos])
      
    body <- paste0('{
  "app": {
    "id": "91XXXXXXXXXX", #sender whatsapp number registered on whapi.io
    "time": ',epoch,',
    "data": {
      "recipient": {
        "id": "',number1,'"
      },
      "message": [
        {
          "time": ',epoch,',
          "type": "text",
          "value": "',message1,'"
        }
      ]
    }
  }
}')
    POST(url, body = body, encode = "json", verbose())
