import React from 'react';
import ReactDOM from 'react-dom';
import Day from '../../components/Day';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Day />, div);
});