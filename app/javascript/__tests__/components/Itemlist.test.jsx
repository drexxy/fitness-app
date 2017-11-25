import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import React from 'react';
import ReactDOM from 'react-dom';
import { mount } from 'enzyme';
import ItemList from '../../components/Itemlist';

describe("ItemList", function(){
  let items;

  beforeEach(() => {
    items = [
      {"name": "Bench Press",},
      {"name": "Deadlifts"},
      {"name": "Squats"},
      ];
  });

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<ItemList items={ items }/>);
    });

    it("creates a ol of items", () => {
      expect(container.find('ol').length).toEqual(1);
      expect(container.find('li').length).toEqual(3);
      expect(container.find('ol').childAt(0).text()).toEqual("Bench Press");
      expect(container.find('ol').childAt(1).text()).toEqual("Deadlifts");
      expect(container.find('ol').childAt(2).text()).toEqual("Squats");
    })
    
    describe("adding an item to a form", function(){
      beforeEach(() => {
        container.find('ol').childAt(0).simulate("click");
      });

    })
  });



});