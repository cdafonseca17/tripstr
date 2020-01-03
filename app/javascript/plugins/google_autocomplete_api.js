function activatePlacesSearch(){
  var input = document.getElementsByClassName('search-google');
  for (var i = 0; i < input.length; i++) {
    addListener(input[i]);
  }

  function addListener(el) {
    const form = el.parentNode;
    console.log(form);
    var autocomplete = new google.maps.places.Autocomplete(el);
    google.maps.event.addListener(autocomplete, 'place_changed', function () {
      var result = autocomplete.getPlace();
      // console.log(result);

      if (result != null) {
        const location = result['name']
        const name = result['name']
        console.log(name);
        const address = result['formatted_address']
        const phone_number = result['international_phone_number']
        const icon = result['icon']
        const types = result['types']
        console.log(types);
        const user_ratings_total = result['user_ratings_total']
        const rating = result['rating']
        const url = result['website']
        const latitude = autocomplete.getPlace().geometry.location.lat();
        const longitude = autocomplete.getPlace().geometry.location.lng();
        const photo_reference = result['photos'][0];
        // console.log(photo_reference);
        // const url_photo_path = `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo_reference}`;

        const inputLocationStep = form.querySelector(".step-location-input-js");
        const inputAddressStep = form.querySelector(".step-address-input-js");
        const inputRating = form.querySelector(".activity-rating-input-js");
        const inputActivityName = form.querySelector('.activity-name-input-js');
        const inputUrl = form.querySelector(".activity-url-input-js");
        const inputTypes = form.querySelector(".activity-types-input-js");
        const inputIcon = form.querySelector(".activity-icon-input-js");
        const inputAddress = form.querySelector(".activity-address-input-js");
        const inputLatitude = form.querySelector(".activity-latitude-input-js");
        const inputLongitude = form.querySelector(".activity-longitude-input-js");
        const inputPhoto = form.querySelector(".activity-photo-input-js");

        if (inputLocationStep != null) {
          inputLocationStep.value = name;
          inputAddressStep.value = address;
          console.log(inputLocationStep, inputAddressStep)
        };

        if (inputActivityName != null) {
          inputRating.value = rating;
          inputActivityName.value = name;
          inputUrl.value = url;
          inputTypes.value = types;
          inputIcon.value = icon;
          inputAddress.value = address;
          inputLatitude.value = latitude;
          inputLongitude.value = longitude;
          inputPhoto.value = photo_reference.getUrl();
          console.log(inputRating,inputActivityName,inputUrl, inputTypes, inputIcon, inputAddress)
        };
      };
    });
  };
};

export default activatePlacesSearch;

// const getPhotos = (photo_reference, formRef) => {
//   const url_path = `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo_reference}&key=${getKey()}`;
//   const inputPhoto = formRef.querySelector(".activity-photo-input-js");
//   const loader = formRef.querySelector('.loader-js');
//   inputPhoto.value = url_path;
//   loader.classList.remove('active');
// }

    // var autocomplete = new google.maps.places.Autocomplete(input[i])
    // console.log(autocomplete);
    // google.maps.event.addListener(autocomplete, 'place_changed', function () {
    //   var result = autocomplete.getPlace();
    //   console.log(result)
    //   if (result != null) {
    //     const location = result['name']
    //     const name = result['name']
    //     const address = result['formatted_address']
    //     const phone_number = result['international_phone_number']
    //     const icon = result['icon']
    //     const types = result['types']
    //     const user_ratings_total = result['user_ratings_total']
    //     const rating = result['rating']
    //     const url = result['website']
    //     const latitude = autocomplete.getPlace().geometry.location.lat();
    //     const longitude = autocomplete.getPlace().geometry.location.lng();
    //     const photos = result['photos'][0].getUrl();

        // const inputLocationStep = document.querySelector(".step-location-input-js");
        // const inputAddressStep = document.querySelector(".step-address-input-js");
        // const inputRating = document.querySelector(".activity-rating-input-js");
        // const inputActivityName = document.querySelector('.activity-name-input-js');
        // const inputUrl = document.querySelector(".activity-url-input-js");
        // const inputTypes = document.querySelector(".activity-types-input-js");
        // const inputIcon = document.querySelector(".activity-icon-input-js");
        // const inputAddress = document.querySelector(".activity-address-input-js");

        // if (inputLocationStep != null) {
        //   inputLocationStep.value = name;
        //   inputAddressStep.value = address;
        //   console.log(inputLocationStep, inputAddressStep)
        // };

        // if (inputActivityName != null) {
        //   inputRating.value = rating;
        //   inputActivityName.value = name;
        //   inputUrl.value = url;
        //   inputTypes.value = types;
        //   inputIcon.value = icon;
        //   inputAddress.value = address;
        //   console.log(inputRating,inputActivityName,inputUrl, inputTypes, inputIcon, inputAddress)
        // };
//   };
//   });
//   };
// };

