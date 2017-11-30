import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import React from 'react';
import ReactDOM from 'react-dom';
import { mount } from 'enzyme';
import WorkoutForm from '../../components/Workoutform';

describe("WorkoutForm", function(){
  let selected;

  beforeEach(() => {
    selected = [
    {"id": "1", "name": "Chest Day"},
    {"id": "2", "name": "Back Day"},
    {"id": "3", "name": "Leg Day"}
    ];
  })

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<WorkoutForm selected={ selected }/>);
    });

    it("creates a form from the exercises", () => {
      expect(container.find('form').length).toEqual(1);
      expect(container.find('fieldset').length).toEqual(6);
      expect(container.find('select').length).toEqual(2);
      expect(container.find('label').length).toEqual(3);
      expect(container.find('input').length).toEqual(6);
      expect(container.find('form').childAt(0).text()).toEqual("");
      expect(container.find('form').childAt(1).text()).toEqual("Name your Workout")
      expect(container.find('form').childAt(2).text()).toEqual("Select how difficult this workout isBeginnerIntermediateExpert")
      expect(container.find('form').childAt(3).text()).toEqual("Choose the most appropriate tagPut on MuscleLose Weight");
      expect(container.find('form').childAt(4).text()).toEqual("Chest Day");
      expect(container.find('form').childAt(5).text()).toEqual("Back Day");
      expect(container.find('form').childAt(6).text()).toEqual("Leg Day")
    });
  });
})