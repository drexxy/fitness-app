import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';

class GymMap extends Component {
  constructor(props){
    super(props);

    this.state = {
      postcode: "",
      center: { lat: 51.7600, lng: 0.0150 }
    }

  this.handleChangePostcode = this.handleChangePostcode.bind(this);
  this.findCenter = this.findCenter.bind(this);
  this.findGyms = this.findGyms.bind(this);
  this.createMarker = this.createMarker.bind(this);
  }

  findCenter(){
    var postcode =  this.state.postcode.replace(/ /g,'+')
    fetch("https://maps.googleapis.com/maps/api/geocode/json?address=" + postcode + "&key=AIzaSyAx2WyxtCj5p7AKHI-fTwfoZWFDJurHgQk").then((response) =>{
      return response.json();
    }).then((location) => {
      this.setState({
        center: {
          lat: location.results[0].geometry.location.lat,
          lng: location.results[0].geometry.location.lng
        }
      })
    }).then(() =>{
      this.findGyms()
    })
  }

  findGyms(){
    var center = new google.maps.LatLng(this.state.center.lat, this.state.center.lng)
    var service = new google.maps.places.PlacesService(this.map.map_)
    service.nearbySearch({
      location: center,
      radius: '1000',
      type: 'gym'
    }, (results, status) => {
      if (status == google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
          var place = results[i];
          this.createMarker(results[i]);
        }
      }
    })
  }

  createMarker(place) {
    var marker = new google.maps.Marker({
      map: this.map.map_,
      position: place.geometry.location
    });

    var infowindow = new google.maps.InfoWindow();
    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name + " " + place.rating + "/5");
      infowindow.open(this.map.map_, this);
    });
  }

  handleChangePostcode(event) {
    this.setState({postcode: event.target.value})
  }

  render() {
    return (
    <div>
      <div className="postcode-query">
        <label htmlFor="postcode">Enter your postcode to find nearby Gyms</label>
        <input name="postcode" onChange={ this.handleChangePostcode }/>
        <button onClick={ this.findCenter }>Find Gyms</button>
      </div>
      <div style={{height: "800px", width: "800px"}} className="col col-2-of-3 map">
        <GoogleMapReact
          bootstrapURLKeys={{
            key:'AIzaSyAcPZ5k7pCoFK0C5HK1WKzIQxlPYlrWMUk',
            language: 'en',
          }}
          center={this.state.center}
          defaultZoom={this.props.zoom}
          ref={(map) => { this.map = map; }}
        >
        </GoogleMapReact>
      </div>
    </div>
    );
  }
}
GymMap.defaultProps = {
  zoom: 15
};

export default GymMap;