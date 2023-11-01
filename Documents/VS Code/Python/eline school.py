name = input("Welcome x! What is your name? ")
print(f"Hello {name}!")

hours = int(input(f"{name}, how many hours do you spend on social media / with Us? "))

if hours > 3:
    bleeding_edge = "Welcome to the Bleeding Edge, where the boundaries between virtual reality and real life are blurred!\nWe value real faces.\nWe love your input.\nWe greatly value your time with us.\nWe appreciate your personal information.\nWe adore the digital mask that you've been putting on each day.\nWe think that you're so brave for entering this world each and every day.\nWe cherish your support for Us.\nWe hope to continue developing at rates that you can't keep up with.\nWe hope to surpass your expectations.\nWe want to blind you with our newest additions.\nWe are excited for the future, aren't you?\nIn fact, we are already there!\nWe are so comfortable here, in our big homes with big cars and big phones.\nDon't get lost, We are waiting for you!"
    print("\033[91m" + bleeding_edge + "\033[0m")
else:
    print("fokr")