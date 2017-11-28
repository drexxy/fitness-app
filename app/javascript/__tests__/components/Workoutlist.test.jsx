import { configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

configure({ adapter: new Adapter() });

import React from 'react';
import ReactDOM from 'react-dom';
import { mount } from 'enzyme';
import WorkoutList from '../../components/Workoutlist';

describe("WorkoutList", function(){
  let workouts;

  beforeEach(() => {
    workouts = JSON.stringify([{id:1, name: "Amazing Workout", difficulty: "Easy", purpose: "Put on Muscle", days: [{id: 1, name: "Chest Day", set_exercises: [{id: 1, sets: 5, reps: 10, exercise:{id: 1, name: "Bench Press"}}]}]}]);
  })

  describe("render", function() {
    let container;

    beforeEach(() => {
      container = mount(<WorkoutList workouts={ workouts }/>);
    });

    it("creates a list of workouts", () => {
      expect(container.find('div').length).toEqual(7);
      expect(container.find('button').length).toEqual(1);
      expect(container.find('span').length).toEqual(1);
    })

    describe("clicking on a list item", () => {
      beforeEach(() =>{
        container.find('button').childAt(0).simulate("click");
      })

      it("expands the list to show the days from the workout", () =>{
        expect(container.find('div').length).toEqual(13);
        expect(container.find('button').length).toEqual(2);
        expect(container.find('span').length).toEqual(2);
      })
    })
  })
});