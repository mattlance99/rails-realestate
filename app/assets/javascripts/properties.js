$(function () {
  let propertyIds

  $('#propertyID').on('click', function(e) {
    $('.content').html("")
    e.preventDefault()
    $.get("/properties" + ".json", function(agent) {
        agent.properties.forEach(function(property) {
        let myProperty = new Property(property)
        console.log(myProperty)
          $('.content').append(myProperty.formatIndex());
        })
    });
  });

  $(document).on("click", ".js-next", function(e) {
    e.preventDefault()
    console.log('hello')
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    var currentId = parseInt($(".js-next").attr("data-id"))
    console.log("/properties/" + nextId + ".json")
    $.getJSON("/properties/" + currentId + "/next.json", function(data) {
      console.log(data)
      $('#show-property').html('')
      let myProperty = new Property(data)
      $('#show-property').html(myProperty.formatShow())
    });
  });
});

class Property {
  constructor (obj){
    this.id = obj.id
    this.address = obj.address
    this.price = obj.price
    this.bedrooms = obj.bedrooms
    this.bathrooms = obj.bathrooms
  }

  formatShow() {
    return `
      <a href="#" class="js-next" data-id="${this.id}">Next...</a>
      <h1 Address: class="propertyAddress">${this.address}</h1>
      <h3>Price:</h3><p class="propertyPrice">${this.price}</p>
      <h3>Bedrooms:</h3><p class="propertyBedrooms">${this.bedrooms}</p>
      <h3>Bathrooms:</h3><p class="propertyBathrooms">${this.bathrooms}</p>
    `
  }

  formatIndex() {
    return `
      <h2>${this.address}</h2>
      <h4>Price: ${this.price}</h4>
      <h4>Bedrooms: ${this.bedrooms}</h4>
      <h4>Bathrooms: ${this.bathrooms}</h4>
      <hr>
    `
  }
}
