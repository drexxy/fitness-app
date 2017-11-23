import React, { Component } from 'react';

class ExerciseList extends Component {

  constructor(props){
    super(props);
    
    this.state = {
      exercises: this.props.exercises || [],
    }
  }

  render(){
    return(
      <ol>
        {
          this.state.exercises.map((exercise, i) => {
            return <li key={i} onClick={() => this.props.handleClick(i) } >{ exercise.name }</li>
          })
        }
      </ol>
    )
  }

}

export default ExerciseList