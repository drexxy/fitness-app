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
      <form action="/days" method="post">
      <input type="hidden" name="authenticity_token" value={token} readOnly={true} />
      <label htmlFor="name">Name your Day</label>
      <input name="day[name]"/>
        {
          this.state.selected.map((exercise, i) => {
            var exerciseId = "set_exercise[exercise_id][" + i + "]";
            var setName = "set_exercise[set][" + i + "]";
            var repsName = "set_exercise[reps][" + i + "]";
            return <fieldset key = {i} >
                <h4>{ exercise.name }</h4>
                <input type="hidden" name={ exerciseId } value={ exercise.id } readOnly={true} />
                <span>  
                  <label htmlFor="sets">Sets</label>
                  <input name={ setName }/>
                </span>
                <span>
                  <label htmlFor="reps">Reps</label>
                  <input name={ repsName }/>
                </span>
              </fieldset>
          })
        }
      <input type="submit" value="Submit"/>
      </form>
    )
  }
}

export default WorkoutForm