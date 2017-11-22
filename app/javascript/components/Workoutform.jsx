import React, { Component } from 'react';

class WorkoutForm extends Component {

  constructor(props){
    super(props);
    this.state = {
      selected: this.props.selected || [],
    }
  }

  render() {
    return(
      <form>
        {
          this.state.selected.map((exercise, i) => {
            return <fieldset key = {i} >
                <h4>{ exercise.name }</h4>
                <span>
                  <label htmlFor="day">Day</label>
                  <input/>
                </span>
                <span>  
                  <label htmlFor="sets">Sets</label>
                  <input/>
                </span>
                <span>
                  <label htmlFor="reps">Reps</label>
                  <input/>
                </span>
              </fieldset>
          })
        }
      </form>
    )
  }
}

export default WorkoutForm