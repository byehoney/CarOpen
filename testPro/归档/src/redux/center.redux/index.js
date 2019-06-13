// center reducer
import * as type from '../type';
import initState from './state';
export default (state=initState,action)=>{
    switch(action.type){
        case type.CENTER:
            return{ ...state,test2:++action.payLoad }
            break;
        case type.HEADER:
            return{ ...state,center_moudle_index:action.payLoad }
            break;
        default:
            return state;
    }
}