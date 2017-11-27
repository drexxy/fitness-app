import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import renderer from 'react-test-renderer';

configure({ adapter: new Adapter() });

import React from 'react';
import ReactDOM from 'react-dom';
import { mount } from 'enzyme';
import GymMap from '../../components/Gymmap';

global.fetch = require('jest-fetch-mock');

describe("ItemList", function(){
  let co_ordinates;

  beforeEach(() => {
    co_ordinates = [
      {"lat": "55.123456", "lng": "0.000000"},
      ];
  });

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<GymMap />);
    });

    it("creates a div containing a google map", () => {
      expect(container.find('div').length).toEqual(7);
    })

    describe("findCenter", function(){
      beforeEach(() => {
        fetch.mockResponse(JSON.stringify({results: [ { geometry: {location: {lat: 51.459766, lng: -0.9587714 }}}]}))
        const input = container.find('input');
        const button = container.find('button');  
        input.simulate('change', { target: { value: 'RG1 8AE' } })
        button.simulate("click")
      })

      it("makes a get request to google maps geocoding API with the postcode", () => {
        expect(fetch.mock.calls.length).toEqual(1)
        expect(fetch.mock.calls[0]).toEqual(['https://maps.googleapis.com/maps/api/geocode/json?address=RG1+8AE&key=AIzaSyAx2WyxtCj5p7AKHI-fTwfoZWFDJurHgQk'])
        expect(container.state().center.lat).toEqual(51.459766)
        expect(container.state().center.lng).toEqual(-0.9587714)
      })

    })
  })
})
