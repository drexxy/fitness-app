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
    {"id": "1", "name": "Bench Press"},
    {"id": "2", "name": "Deadlifts"},
    {"id": "3", "name": "Squats"}
    ];
  })

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<WorkoutForm selected={ selected }/>);
    });

    it("creates a form from the exercises", () => {
      expect(container.find('form').length).toEqual(1);
      expect(container.find('fieldset').length).toEqual(3);
      expect(container.find('label').length).toEqual(6);
      expect(container.find('input').length).toEqual(8);
      expect(container.find('form').childAt(0).text()).toEqual("");
      expect(container.find('form').childAt(1).text()).toEqual("Bench PressSetsReps");
      expect(container.find('form').childAt(2).text()).toEqual("DeadliftsSetsReps");
      expect(container.find('form').childAt(3).text()).toEqual("SquatsSetsReps");
    });
  });
})