 const getAddress=(lat,lng)=> { 
        var latitude = "latitude=" + lat;
        var longitude = "&longitude=" + lng;
        var query = latitude + longitude + "&localityLanguage=en";
      
        const Http = new XMLHttpRequest();
      
        var bigdatacloud_api =
          "https://api.bigdatacloud.net/data/reverse-geocode-client?";
      
        bigdatacloud_api += query;
      
        Http.open("GET", bigdatacloud_api);
        Http.send();
      
        Http.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);
            console.log(myObj);
          }
        }
      }