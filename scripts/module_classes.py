
class Module():
    """ Metaclass for all modules bundling general functionalities """
    def __init__(self):
        super().__init__()
    def return_ports(self):
        """ return all variables of class """
        return vars(self)
    def return_as_list(self, input):
        """ returning input in list format """
        if input is list:
            return input
        else:
            return [input]


class Mixer(Module):
    """
    The mixer module is mixing the three inputs together
    """
    def __init__(self, in_list, param_list):
        super().__init__()
        self.name = "mixer_partial"
        self.n_in = 3
        self.n_out = 1

        self.in0 = self.return_as_list(in_list[0])
        self.in1 = self.return_as_list(in_list[1])
        self.in3 = self.return_as_list(in_list[2])

        self.valve_opening0 = param_list[0]
        self.valve_opening1 = param_list[1]
        self.valve_opening2 = param_list[2]

        self.out0 = self.in0 * self.valve_opening0 + self.in1 * self.valve_opening1 + self.in2 * self.valve_opening2



class Filter(Module):
    """
    The filter module can filter out: the color string from param_list[0]
    """
    def __init__(self, in_list, param_list):
        super().__init__()
        self.name = "filter_partial"
        self.n_in = 1
        self.n_out = 1
        self.filt = param_list[0] # color that gets filtered out

        self.in0 = self.return_as_list(in_list[0])

        self.out0 = [i for i in self.in0 if i != self.filt]


class Distill(Module):
    """
    The distill module can separate the following color from every mix: the color string from param_list[0]
    """
    def __init__(self, in_list, param_list):
        super().__init__()
        self.name = "still_partial"
        self.n_in = 1
        self.n_out = 2
        self.still = param_list[0]

        self.in0 = self.return_as_list(in_list[0])

        self.out0 = [i for i in self.in1 if i == self.still]
        self.out1 = [i for i in self.in1 if i != self.still]


class Bottling(Module):
    """
    Bottling is simulating the logistic bottling process
    """
    def __init__(self, in_list):
        super().__init__()
        self.name = "bottling_partial"
        self.n_in = 1
        self.n_out = 1

        self.in1 = self.return_as_list(in_list[0])
        self.out1 = self.in1


class Source(Module):
    def __init__(self, in_list):
        super().__init__()
        self.name = "source"
        self.out0 = self.return_as_list(in_list[0])


class Sink(Module):
    def __init__(self, in_list):
        super().__init__()
        self.name = "sink"
        self.in0 = self.return_as_list(in_list[0])
