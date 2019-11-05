User.destroy_all
Gif.destroy_all
Mood.destroy_all

user1 = User.create(
  name: "Kesha"
)

user2 = User.create(
  name: "Paula"
)

user3 = User.create(
  name: "Blake"
)

gif1 = Gif.create(
  category: "frustrated",
  url: "https://media3.giphy.com/media/Xj8orUvjQ2SLS/giphy.gif?cid=790b76115cd176235731665032f1dd62&rid=giphy.gif",
  desc: "are you fucking kidding me"
)

gif2 = Gif.create(
  category: "frustrated",
  url: "https://media.giphy.com/media/l41m3Yq3dqnXeGfQY/giphy.gif",
  desc: "startrek teddy bear"
)
gif3 = Gif.create(
  category: "frustrated",
  url: "https://media1.giphy.com/media/UavL6mz9R0Xpm/giphy.gif?cid=790b76115cd177006c586d4d32ed3f25&rid=giphy.gif",
  desc: "panda desk"
)

gif4 = Gif.create(
  category: "frustrated",
  url: "https://media3.giphy.com/media/tZiLOffTNGoak/giphy.gif?cid=790b76115cd175d6557556634dc24e8d&rid=giphy.gif",
  desc: "Lilo & Stitch"
)

gif5 = Gif.create(
  category: "frustrated",
  url: "https://media3.giphy.com/media/8GbvxxFHJDBa8/giphy.gif?cid=790b76115cd176235731665032f1dd62&rid=giphy.gif",
  desc: "Ice Cube"
)
gif6 = Gif.create(
  category: "excited",
  url: "https://media0.giphy.com/media/dkGhBWE3SyzXW/giphy.gif?cid=790b76115cd177d8522e747559314543&rid=giphy.gif",
  desc: "hell yeah"
)

gif7 = Gif.create(
  category: "excited",
  url: "https://media0.giphy.com/media/MJs7EYwHyG8XC/giphy.gif?cid=790b76115cd177ec2f7178365107269e&rid=giphy.gif",
  desc: "tupac"
)

gif8 = Gif.create(
  category: "excited",
  url: "https://media2.giphy.com/media/l1J9ODTGkF996dNzG/giphy.gif?cid=790b76115cd178de423531357796693e&rid=giphy.gif",
  desc: "dab line"
)

gif9 = Gif.create(
  category: "excited",
  url: "https://media0.giphy.com/media/nNxT5qXR02FOM/giphy.gif?cid=790b76115cd177d8522e747559314543&rid=giphy.gif",
  desc: "shaq cat"
)

gif10 = Gif.create(
  category: "excited",
  url: "https://media2.giphy.com/media/LvKK06Ldidqbm/giphy.gif?cid=790b76115cd17f114e78526d55ef3262&rid=giphy.gif",
  desc: "lakers"
)

gif11 = Gif.create(
  category: "calm",
  url: "https://media0.giphy.com/media/7NUdxH6uzeI1i/giphy.gif?cid=790b76115cd1798f4b6f6569558b3e98&rid=giphy.gif",
  desc: "dog vacuum"
)

gif12 = Gif.create(
  category: "calm",
  url: "https://media1.giphy.com/media/8OJdqYqN1Nii3UTD6l/giphy.gif?cid=790b76115cd179ba5143365041fac91c&rid=giphy.gif",
  desc: "bob ross"
)

gif13 = Gif.create(
  category: "calm",
  url: "https://media0.giphy.com/media/l4EpfjeKLkQPp0cYo/giphy.gif?cid=790b76115cd179ec4e6a584536f7f8c6&rid=giphy.gif",
  desc: "teresa g"
)

gif14 = Gif.create(
  category: "calm",
  url: "https://media0.giphy.com/media/j0A3pPBp0NAXe/giphy.gif?cid=790b76115cd17a5c714e42336b59512d&rid=giphy.gif",
  desc: "vanilla ice"
)

gif15 = Gif.create(
  category: "calm",
  url: "https://media2.giphy.com/media/Q7kfqzaYuAwSI/giphy.gif?cid=790b76115cd17aaa4f6e466e5564e13b&rid=giphy.gif",
  desc: "honey boo boo"
)

gif16 = Gif.create(
  category: "happy",
  url: "https://media1.giphy.com/media/10t57cXgo7x5kI/giphy.gif?cid=790b76115cd17aea5853777541a677f4&rid=giphy.gif",
  desc: "dog smile"
)

gif17 = Gif.create(
  category: "happy",
  url: "https://media3.giphy.com/media/1mik4VnQ2yRfo1MJyw/giphy.gif?cid=790b76115cd17b3a452f4a4e59491829&rid=giphy.gif",
  desc: "kris"
)

gif18 = Gif.create(
  category: "happy",
  url: "https://media3.giphy.com/media/l1J9Forw8xWRvJNT2/giphy.gif?cid=790b76115cd17e0b416d6365455d2d7d&rid=giphy.gif",
  desc: "beyonce"
)

gif19 = Gif.create(
  category: "happy",
  url: "https://media1.giphy.com/media/9xrrQ9UX8ImQWlHGwv/giphy.gif?cid=790b76115cd17b62396c33612e98f65e&rid=giphy.gif",
  desc: "kid self hug"
)

gif20 = Gif.create(
  category: "happy",
  url: "https://media2.giphy.com/media/26xBSn7d5mbsOZcys/giphy.gif?cid=790b76115cd17c024f75326449ce4f24&rid=giphy.gif",
  desc: "2 chainz"
)

gif21 = Gif.create(
  category: "sad",
  url: "https://media0.giphy.com/media/58FMysL4cmjsIales5/giphy.gif?cid=790b76115cd17c85334b51596b6ad404&rid=giphy.gif",
  desc: "i wanna cry"
)

gif22 = Gif.create(
  category: "sad",
  url: "https://media3.giphy.com/media/2FazgxLhFpYv4t93G/giphy.gif?cid=790b76115cd17cef37397353637ae650&rid=giphy.gif",
  desc: "sad cat"
)

gif23 = Gif.create(
  category: "sad",
  url: "https://media2.giphy.com/media/11HxElzKUMmBxu/giphy.gif?cid=790b76115cd17d843730324941e2cc51&rid=giphy.gif",
  desc: "Oprah"
)

gif24 = Gif.create(
  category: "sad",
  url: "https://media0.giphy.com/media/ldC94BvZwmiIw/giphy.gif?cid=790b76115cd17d843730324941e2cc51&rid=giphy.gif",
  desc: "doll"
)

gif25 = Gif.create(
  category: "sad",
  url: "https://media1.giphy.com/media/65WcnWvJNkFEs/giphy.gif?cid=790b76115cd17dbf75434d376781cac9&rid=giphy.gif",
  desc: "ramona"
)

gif26 = Gif.create(
  category: "hangry",
  url: "https://media.giphy.com/media/GnCc88zZhSVUc/giphy.gif",
  desc: "hamster"
)

gif27 = Gif.create(
  category: "hangry",
  url: "https://media.giphy.com/media/bSIDMHet9dtRK/giphy.gif",
  desc: "lucy"
)

gif28 = Gif.create(
  category: "hangry",
  url: "https://media.giphy.com/media/lVf9n3yRY9mTh0j11s/giphy.gif",
  desc: "dog snarl"
)

gif29 = Gif.create(
  category: "hangry",
  url: "https://media.giphy.com/media/7T8wjVw47Dk62MuSjW/giphy.gif",
  desc: "zombie gf"
)

gif30 = Gif.create(
  category: "hangry",
  url: "https://media.giphy.com/media/2A0Jk5YKtG0U4UlZES/giphy.gif",
  desc: "where's the food"
)

gif31 = Gif.create(
  category: "tired",
  url: "https://media.giphy.com/media/l1KVaj5UcbHwrBMqI/giphy.gif",
  desc: "baby"
)

gif32 = Gif.create(
  category: "tired",
  url: "https://media.giphy.com/media/ycVCXvbcctSU0/giphy.gif",
  desc: "kid and dog"
)

gif33 = Gif.create(
  category: "tired",
  url: "hhttps://media.giphy.com/media/up8gI8DCcdd1S/giphy.gif",
  desc: "cartoon snore"
)

gif34 = Gif.create(
  category: "tired",
  url: "https://media.giphy.com/media/xT0BKK1GxHNuBev52E/giphy.gif",
  desc: "monsters inc girl"
)

gif35 = Gif.create(
  category: "tired",
  url: "https://media.giphy.com/media/Jap1tdjahS0rm/giphy.gif",
  desc: "patrick"
)

gif36 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/dt55CHaeQTNIfMpLRV/giphy.gif",
  desc: "fake noodle"
)

gif37 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/BK8hW6YBpnvSU/giphy.gif",
  desc: "pug"
)

gif38 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/Adqe9XUP3x9LO/giphy.gif",
  desc: "camo"
)

gif39 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/B37cYPCruqwwg/giphy.gif",
  desc: "jim"
)

gif40 = Gif.create(
  category: "imposter",
  url: "https://media.giphy.com/media/seD8D8ztoUS5i/giphy.gif",
  desc: "why don't you just quit"
)

gif41 = Gif.create(
  category: "flirty",
  url: "https://media.giphy.com/media/l0HlSpd3udlStfw4M/giphy.gif",
  desc: "mannequin"
)

gif42 = Gif.create(
  category: "flirty",
  url: "https://media.giphy.com/media/xTiTnHvXHHxOTcdmxO/giphy.gif",
  desc: "spiderman"
)

gif43 = Gif.create(
  category: "flirty",
  url: "https://media.giphy.com/media/uv8al2L9QYOSA/giphy.gif",
  desc: "will smith"
)

gif44 = Gif.create(
  category: "flirty",
  url: "https://media.giphy.com/media/Y0sedHLAR0kf03wg8P/giphy.gif",
  desc: "jordan peele"
)

gif45 = Gif.create(
  category: "flirty",
  url: "https://media.giphy.com/media/A9PfkBjVYs9R6/giphy.gif",
  desc: "hello"
)

gif46 = Gif.create(
  category: "angry",
  url: "https://media.giphy.com/media/10H4by255F2UsU/giphy.gif",
  desc: "hulk"
)

gif47 = Gif.create(
  category: "angry",
  url: "https://media.giphy.com/media/l1J9u3TZfpmeDLkD6/giphy.gif",
  desc: "shake brush"
)

gif48 = Gif.create(
  category: "angry",
  url: "https://media.giphy.com/media/Zaeyj0lscMhA4/giphy.gif",
  desc: "fire eyes"
)

gif49 = Gif.create(
  category: "angry",
  url: "https://media.giphy.com/media/ixYRj3H9HOzWE/giphy.gif",
  desc: "anime"
)

gif50 = Gif.create(
  category: "angry",
  url: "https://media.giphy.com/media/qgZnIUPFcS3hC/giphy.gif",
  desc: "little boy"
)
mood1 = Mood.create(
  gif_id: gif1.id,
  user_id: user1.id,
  caption: "I'm so happy today!"
)
