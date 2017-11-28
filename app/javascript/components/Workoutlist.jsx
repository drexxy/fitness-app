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
    return(
      <MuiThemeProvider>
        <div>
          {
            this.state.workouts.map((workout, i) => {
              return (
                <List key={i}>
                  <ListItem
                  primaryText={ workout.name }
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
              )
            })
          }
        </div>
      </MuiThemeProvider>
    )
  }
}

export default WorkoutList