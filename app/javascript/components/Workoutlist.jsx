import React, { Component } from 'react';
import {List, ListItem} from 'material-ui/List';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';

class WorkoutList extends Component {

  constructor(props){
    super(props);
    this.state = {
      workouts: JSON.parse(this.props.workouts) || []
    }
  }

  render(){
    if(document.getElementsByName('csrf-token')[0] !== undefined) {
      var token = document.getElementsByName('csrf-token')[0].content;
    } else {
      var token = "123456"
    }
    return(
      <MuiThemeProvider>
        <div className="wrapper" >
          {
            this.state.workouts.map((workout, i) => {
              return (
                <div key={i} className="grid">
                  <div className="col col-1-of-2">
                    <List>
                      <ListItem
                      primaryText={ workout.name }
                      secondaryText={ workout.difficulty  + " - " +  workout.purpose }
                      primaryTogglesNestedList={true}
                      nestedItems={
                        workout.days.map((day, i) => {
                          return <ListItem
                            key={i}
                            primaryText={ day.name } 
                             nestedItems={
                              day.set_exercises.map((set_exercise, i) => {
                                return <ListItem
                                  key={i}
                                  primaryText={ set_exercise.exercise.name } 
                                  secondaryText={ set_exercise.sets  + " sets of " +  set_exercise.reps }
                                />
                              })
                            }
                          />
                        })
                      }
                      />
                    </List>
                  </div>
                  <div className= "col col-1-of-3 workout-select">
                    <a href={"workout/" + workout.id }>Select Workout</a>
                  </div>
                </div>  
              )
            })
          }
        </div>
      </MuiThemeProvider>
    )
  }
}

export default WorkoutList