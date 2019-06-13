import * as types from '../type';
export default{
    changeModule(num){
        return (dispatch,getState) =>{
            dispatch({type:types.HEADER,payLoad:num})
        }
    }
}