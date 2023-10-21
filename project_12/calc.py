def calс():
    try:
        num_1 = float(input('Введите первое число (дробные числа водятся через точку): '))
        arithmetic_sign = input('Введите арифметический знак (+, -, *, /): ')
        num_2 = float(input('Введите второе число (дробные числа водятся через точку): '))

        if arithmetic_sign == '+':
            result = num_1 + num_2
            print(result)
        elif arithmetic_sign == '-':
            result = num_1 - num_2
            print(result)
        elif arithmetic_sign == '*':
            result = num_1 * num_2
            print(result)
        elif arithmetic_sign == '/':
            if num_2 != 0:
                result = num_1 / num_2
                print(result)
            else: print('На ноль делить нельзя')
        elif arithmetic_sign != '/' or '+' or '-' or '*':
            result = 'Введите допустимый арифметический знак'
            print(result)
    except ZeroDivisionError:
            result = ''
    except ValueError:
            print('Введите число или введите дробное числа через точку')
calс()
