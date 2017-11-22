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

    it("creates a ol of exercises", () => {
      expect(container.find('form').length).toEqual(1);
      expect(container.find('fieldset').length).toEqual(3);
      expect(container.find('label').length).toEqual(9);
      expect(container.find('input').length).toEqual(9);
      expect(container.find('form').childAt(0).text()).toEqual("Bench PressDaySetsReps");
      expect(container.find('form').childAt(1).text()).toEqual("DeadliftsDaySetsReps");
      expect(container.find('form').childAt(2).text()).toEqual("SquatsDaySetsReps");
    });
  });
})