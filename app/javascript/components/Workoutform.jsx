import React, { Component } from 'react';

class WorkoutForm extends Component {

  constructor(props){
    super(props);
    this.state = {
      selected: this.props.selected || [],
    }
  }

  render() {
    if(document.getElementsByName('csrf-token')[0] !== undefined) {
      var token = document.getElementsByName('csrf-token')[0].content;
    } else {
      var token = "123456"
    }
    return(
      <form action="/workouts" method="post">
      <input type="hidden" name="authenticity_token" value={token} readOnly={true} />
      <label htmlFor="name">Name your Workout</label>
      <input name="workout[name]"/>
      <label htmlFor="difficulty">Select how difficult this workout is</label>
      <select name="workout[difficulty]">
        <option value="Beginner">Beginner</option>
        <option value="Intermediate">Intermediate</option>
        <option value="Expert">Expert</option>
      </select>
      <label htmlFor="purpose">Choose the most appropriate tag</label>
      <select name="workout[purpose]">
        <option value="Put on muscle">Put on Muscle</option>
        <option value="Lose weight">Lose Weight</option>
      </select>
        {
          this.state.selected.map((day, i) => {
            var dayId = "workout[day_id][" + i + "]";
            return <fieldset key = {i} >
                <h4>{ day.name }</h4>
                <input type="hidden" name={ dayId } value={ day.id } readOnly={true} />
              </fieldset>
          })
        }
      <input type="submit" value="Submit"/>
      </form>
    )
  }
}

export default WorkoutForm