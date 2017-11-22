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
      {name: "Bench Press", muscleGroup: "Chest" },
      {name: "Deadlifts", muscleGroup: "Back" },
      {name: "Squats", muscleGroup: "Legs" },
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

    describe("editing a question", function() {
      beforeEach(() => {
        container.find('ol').childAt(0).simulate("click");
      });

      it("replaces the contents of the li with an input box", () => {
       let inputBox = container.find('ol').childAt(0).find('input');
       expect(inputBox.length).toEqual(1);
       expect(inputBox.props().defaultValue).toEqual("What is ES6?")
      });
    })

    describe("adding a question", function(){
      it("adds a new question to the ol of questions", () => {
        expect(container.find('li').length).toEqual(3);
        expect(container.find('ol').childAt(0).text()).toEqual("What is ES6?");
      })
    });
  });

});