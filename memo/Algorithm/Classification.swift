import Foundation
/**
 * Algoritimo básico para repetição espaçada.
 * se a classificação for 0, ele mantem para revisar no mesmo dia.
 * se a classificação for 1, ele faz vc revisar no dia sequinte
   e reduz pela metade a quantidade de dias a serem incrementados
   no próximo acerto.
 * se a classificação for 2, ele faz vc revisar daqui ao dobro de dias
   da última espera.
 */

struct AlgorithmData {
    var days: Int = 0
    var lastIncrement: Int = 0
}

class Classification {

    static func classificate(val: Int, lastDayIncremented: Int) -> AlgorithmData {
        var values = AlgorithmData()
        
        switch val {
        case 1:
            values.days = 1
            
            if lastDayIncremented > 1 {
                if (lastDayIncremented % 2) == 0 {
                    values.lastIncrement = lastDayIncremented / 2
                } else {
                    values.lastIncrement = (lastDayIncremented + 1) / 2
                }
            } else {
                values.lastIncrement = values.days
            }
    
            return values
        case 2:
            values.days = lastDayIncremented * 2
            values.lastIncrement = values.days

            return values
        default:
            values.days = 0
            values.lastIncrement = 0

            return values
        }
    }
}
