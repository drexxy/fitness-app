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
        {
          this.state.selected.map((exercise, i) => {
            var setName = "workout[set][" + i + "]";
            var repsName = "workout[reps][" + i + "]";
            return <fieldset key = {i} >
                <h4>{ exercise.name }</h4>
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
      <input type="submit"/>
      </form>
    )
  }
}

export default WorkoutForm