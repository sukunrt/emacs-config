class first(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y


class second(first):
    def __init__(self, x, y):
        first.__init__(self,x,y)


    
    
