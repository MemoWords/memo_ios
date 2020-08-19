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
class Classification {

    static func classificate(val: Int, lastDayIncremented: Int) -> [Int] {
        var values = [0, 0]

        switch (val) {
            case 1:
                values[0] = 1
                if (lastDayIncremented > 1) {
                    if (lastDayIncremented % 2) == 0 {
                        values[1] = lastDayIncremented / 2
                    } else {
                        values[1] = (lastDayIncremented + 1) / 2
                    }
                } else {
                    values[1] = values[0]
                }
                
                return values

            case 2:
                values[0] = lastDayIncremented * 2
                values[1] = values[0]

                return values

            default:
                values[0] = 0
                values[1] = 0

                return values
                
        }
    }
}
