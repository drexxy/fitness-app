import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import React from 'react';
import ReactDOM from 'react-dom';
import { mount } from 'enzyme';
import ExerciseList from '../../components/Exerciselist';

describe("ExerciseList", function(){
  let exercises;

  beforeEach(() => {
    exercises = [
      {"name": "Bench Press", "muscleGroup": "Chest" },
      {"name": "Deadlifts", "muscleGroup": "Back" },
      {"name": "Squats", "muscleGroup": "Legs" },
      ];
  });

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<ExerciseList exercises={ exercises }/>);
    });

    it("creates a ol of exercises", () => {
      expect(container.find('ol').length).toEqual(1);
      expect(container.find('li').length).toEqual(3);
      expect(container.find('ol').childAt(0).text()).toEqual("Bench Press");
      expect(container.find('ol').childAt(1).text()).toEqual("Deadlifts");
      expect(container.find('ol').childAt(2).text()).toEqual("Squats");
    })
  });


});