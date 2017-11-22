import React, { Component } from 'react';
import WorkoutForm from './Workoutform'
import ExerciseList from './Exerciselist'

class Workout extends Component {

  constructor(props){
    super(props);
    this.state = {
      selected: [],
    }
  this.handleClick = this.handleClick.bind(this)
  }

  handleClick(i){
    console.log(this)
    this.state.selected.push(this.props.exercises[i])
    this.setState({
      selected: this.state.selected
    })
  
  }

  render(){
    return <div className="grid">
        <div className="workout-list col col-3-of-4">
          <WorkoutForm selected = { this.state.selected } />
        </div>
        <div className="exercise-list col col-1-of-4">
          <ExerciseList exercises = { this.props.exercises } handleClick = { this.handleClick } /> 
        </div>
      </div>
  }

}

export default Workout