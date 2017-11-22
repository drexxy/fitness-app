import React from 'react';
import ReactDOM from 'react-dom';
import Workout from '../../components/Workout';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Workout />, div);
});