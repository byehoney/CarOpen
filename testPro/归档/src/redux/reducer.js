//合并所有reducer
import { combineReducers } from 'redux';
import center_reducer from './center.redux';
import left_reducer from './left.redux';

const ROOT_REDUCER = combineReducers({
    center_reducer,
    left_reducer
})

export default ROOT_REDUCER;