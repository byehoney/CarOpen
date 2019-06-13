import * as types from '../type';
const test = (t)=>{
    return {type:types.LEFT,payLoad:t}
}
export default{
    add(){
        return (dispatch,getState) =>{
            let _state = getState().left_reducer.test1++;
            console.log(_state)
            dispatch({type:types.LEFT,payLoad:_state})
        }
    }
}