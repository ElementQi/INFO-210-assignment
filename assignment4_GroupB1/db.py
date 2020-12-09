import psycopg2

query_list=[
    "1. Which are the given and family names of the G2 mid laner?",
    "2. How many teams take part in League of Legends World Championship 2020?",
    "3. Which team does player Knight work for at present?",
    "4. What is the band of computers used for League of Legends World Championship 2020?",
    "5. Which team did player JackeyLove ever work for?",
    "6. For which players does Coach Clearlove tutor now?",
    "7. How many teams in region League of Legends Pro League take part in League of Legends World Championship 2020?",
    "8. Who is the Coach of team RNG?",
    "9. How many leagues take part in League of Legends World Championship 2020?",
    "10. How old is player Caps in team G2 in 2020?",
    "11. Sort the year of the competition and the number of prizes in descending order of the prize money.",
    "12. Which league has NIKE sponsored?",
    "13. Who is the MID laner tutored by Zhan Ma?",
    "14. What is the average age of all players?",
    "15. From 2014 to 2020, the number of times the LoL World Championship was held in China.",
    "16. Count the number of players in each country.",
    "17. Who is the oldest manager and what club he manages.",
    "18. Find all years with higher bonuses than the previous year.",
    "19. Find players who belong to the same team.",
    "20. Find sponsor companies with the same major product but different sponsors.",
    "21. What are the names of the coaches who cannot find players?",
    "22. Count the number of managers in each country.",
    "23. Who is the mid laner under Lee Kyung-sik's management?",
    "24. Who is the head coach of Faker's team?",
    "25. What is the nationality of the assistant coach of Meiko's team?",
    "26. Where is the city of Crisp's team?",
    "27. In 2020, the major product is the sports sponsor company sponsored by those teams?",
    "28. What is the full name of the league to which C9 belongs?",
    "29. What is the central city of the league where the G2 team is located?",
    "30. Which league does player Rasmus Borregaard Winther’s team belong to?",
    "31. What is the main language of the SKT team?",
    "32. What language does player Faker speak?",
    "33. What language does manager Oliver speak?",
    "34. Who is the sponsor of the year with the highest bonus?",
    "35. What is the sponsor of the team SKT?",
    "36. Who are the players that the nationality is Chinese and the role is ADC?",
    "37. What is the assistant coach of player Doinb?",
    "38. Find all years with more teams than the previous year.",
    "39. Who is the sponsor of player Song Eui-jin’s team?",
    "40. Where is the main location of the league where the SSG is located?",
    "41. What are the names of the coaches who are not coaching anyone?",
    "42. What the player whose tutor is Chen Guan-ting and whose role is SUP is?"
]

with open('queryDB.sql', 'r') as fh:
    raw = fh.read()
    no_intent = raw.replace('\n', ' ')
    sql_list = no_intent.split(';')[:-1]

with open('createDB.sql', 'r') as fh:
    raw = fh.read()
    no_intent = raw.replace('\n', ' ')
    table_list = no_intent.split(';')[:-1]

with open('insertData.sql', 'r') as fh:
    raw = fh.read()
    no_intent = raw.replace('\n', ' ')
    insert_list = no_intent.split(';')[:-1]


conn = psycopg2.connect(database='LOL',
                        user='postgres',
                        password='04691268',
                        host='127.0.0.1',
                        port='5432')

def get_menu_choice(message, valid, default=None, force_lower=False):
    message += ": " if default is None else " [{0}]: ".format(default)
    while True:
        line = input(message)
        if not line and default is not None:
            return default
        if line not in valid:
            print("ERROR only {0} are valid choices".format(
                  ", ".join(["'{0}'".format(x)
                  for x in valid])))
        else:
            return line if not force_lower else line.lower()

def only_execute(lst):
    for i in lst:
        with conn.cursor() as cur:
            cur.execute(i)
            conn.commit()


def main():
    active = True
    while active:
        sql_len = len(sql_list)
        print('There are %d sql queries here:'%sql_len)
        for query in query_list:
            print(query)
        valid = [str(x) for x in range(1, sql_len+1)]
        valid.append('q')
        message = '\nEnter the index number of the query that you want to execute'
        real_index = int(get_menu_choice(message=message, valid=valid))
        with conn.cursor() as cur:
            sql = sql_list[real_index - 1]
            cur.execute(sql)
            result = cur.fetchall()
            print(query_list[real_index - 1])
            for row in result:
                print(*row)
        quit_message = '\nQuery again? Press Y/y for yes N/n for no'
        quit_valid = ['Y', 'y', 'N', 'n']
        quit = get_menu_choice(message=quit_message, valid=quit_valid, default='Y')
        if quit in ['N', 'n']:
            active = False
        else:
            pass

if __name__ == '__main__':
    only_execute(table_list)
    only_execute(insert_list)
    main()