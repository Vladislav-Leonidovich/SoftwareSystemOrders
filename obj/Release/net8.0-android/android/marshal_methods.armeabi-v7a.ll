; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [113 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [226 x i32] [
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 1
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 10
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 105
	i32 67008169, ; 3: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 34
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 48
	i32 83839681, ; 5: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 18
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 98
	i32 136584136, ; 7: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 33
	i32 140062828, ; 8: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 26
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 53
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 71
	i32 205061960, ; 11: System.ComponentModel => 0xc38ff48 => 83
	i32 317674968, ; 12: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 31
	i32 318968648, ; 13: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 321963286, ; 14: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 9
	i32 342366114, ; 15: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 60
	i32 379916513, ; 16: System.Threading.Thread.dll => 0x16a510e1 => 105
	i32 385762202, ; 17: System.Memory.dll => 0x16fe439a => 90
	i32 395744057, ; 18: _Microsoft.Android.Resource.Designer => 0x17969339 => 35
	i32 409257351, ; 19: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 29
	i32 442565967, ; 20: System.Collections => 0x1a61054f => 80
	i32 450948140, ; 21: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 59
	i32 469710990, ; 22: System.dll => 0x1bff388e => 108
	i32 489220957, ; 23: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 7
	i32 498788369, ; 24: System.ObjectModel => 0x1dbae811 => 95
	i32 513247710, ; 25: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 43
	i32 538707440, ; 26: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 28
	i32 539058512, ; 27: Microsoft.Extensions.Logging => 0x20216150 => 40
	i32 627609679, ; 28: Xamarin.AndroidX.CustomView => 0x2568904f => 57
	i32 627931235, ; 29: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 20
	i32 662205335, ; 30: System.Text.Encodings.Web.dll => 0x27787397 => 102
	i32 672442732, ; 31: System.Collections.Concurrent => 0x2814a96c => 78
	i32 722857257, ; 32: System.Runtime.Loader.dll => 0x2b15ed29 => 99
	i32 759454413, ; 33: System.Net.Requests => 0x2d445acd => 93
	i32 775507847, ; 34: System.IO.Compression => 0x2e394f87 => 87
	i32 777317022, ; 35: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 26
	i32 789151979, ; 36: Microsoft.Extensions.Options => 0x2f0980eb => 42
	i32 823281589, ; 37: System.Private.Uri.dll => 0x311247b5 => 96
	i32 830298997, ; 38: System.IO.Compression.Brotli => 0x317d5b75 => 86
	i32 869139383, ; 39: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 11
	i32 880668424, ; 40: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 25
	i32 904024072, ; 41: System.ComponentModel.Primitives.dll => 0x35e25008 => 81
	i32 918734561, ; 42: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 22
	i32 961460050, ; 43: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 15
	i32 967690846, ; 44: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 60
	i32 990727110, ; 45: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 24
	i32 992768348, ; 46: System.Collections.dll => 0x3b2c715c => 80
	i32 1012816738, ; 47: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 70
	i32 1028951442, ; 48: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 39
	i32 1035644815, ; 49: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1043950537, ; 50: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 5
	i32 1044663988, ; 51: System.Linq.Expressions.dll => 0x3e444eb4 => 88
	i32 1052210849, ; 52: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 62
	i32 1082857460, ; 53: System.ComponentModel.TypeConverter => 0x408b17f4 => 82
	i32 1084122840, ; 54: Xamarin.Kotlin.StdLib => 0x409e66d8 => 75
	i32 1098259244, ; 55: System => 0x41761b2c => 108
	i32 1108272742, ; 56: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 27
	i32 1117529484, ; 57: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 21
	i32 1118262833, ; 58: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 17
	i32 1168523401, ; 59: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 23
	i32 1178241025, ; 60: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 67
	i32 1260983243, ; 61: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 3
	i32 1293217323, ; 62: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 58
	i32 1308624726, ; 63: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 12
	i32 1324164729, ; 64: System.Linq => 0x4eed2679 => 89
	i32 1336711579, ; 65: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 32
	i32 1373134921, ; 66: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 33
	i32 1376866003, ; 67: Xamarin.AndroidX.SavedState => 0x52114ed3 => 70
	i32 1406073936, ; 68: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 54
	i32 1430672901, ; 69: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 1
	i32 1461004990, ; 70: es\Microsoft.Maui.Controls.resources => 0x57152abe => 7
	i32 1462112819, ; 71: System.IO.Compression.dll => 0x57261233 => 87
	i32 1469204771, ; 72: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 73: Microsoft.Extensions.Primitives => 0x57a5e912 => 43
	i32 1480492111, ; 74: System.IO.Compression.Brotli.dll => 0x583e844f => 86
	i32 1526286932, ; 75: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 31
	i32 1543031311, ; 76: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 104
	i32 1622152042, ; 77: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 64
	i32 1624863272, ; 78: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 73
	i32 1636350590, ; 79: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 56
	i32 1639515021, ; 80: System.Net.Http.dll => 0x61b9038d => 91
	i32 1639986890, ; 81: System.Text.RegularExpressions => 0x61c036ca => 104
	i32 1657153582, ; 82: System.Runtime => 0x62c6282e => 100
	i32 1658251792, ; 83: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 74
	i32 1677501392, ; 84: System.Net.Primitives.dll => 0x63fca3d0 => 92
	i32 1679769178, ; 85: System.Security.Cryptography => 0x641f3e5a => 101
	i32 1729485958, ; 86: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 52
	i32 1743415430, ; 87: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 2
	i32 1766324549, ; 88: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 71
	i32 1770582343, ; 89: Microsoft.Extensions.Logging.dll => 0x6988f147 => 40
	i32 1780572499, ; 90: Mono.Android.Runtime.dll => 0x6a216153 => 111
	i32 1782862114, ; 91: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 18
	i32 1788241197, ; 92: Xamarin.AndroidX.Fragment => 0x6a96652d => 59
	i32 1793755602, ; 93: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 10
	i32 1808609942, ; 94: Xamarin.AndroidX.Loader => 0x6bcd3296 => 64
	i32 1813058853, ; 95: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 75
	i32 1813201214, ; 96: Xamarin.Google.Android.Material => 0x6c13413e => 74
	i32 1818569960, ; 97: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 68
	i32 1828688058, ; 98: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 41
	i32 1853025655, ; 99: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 27
	i32 1858542181, ; 100: System.Linq.Expressions => 0x6ec71a65 => 88
	i32 1875935024, ; 101: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 9
	i32 1893218855, ; 102: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 3
	i32 1910275211, ; 103: System.Collections.NonGeneric.dll => 0x71dc7c8b => 79
	i32 1953182387, ; 104: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 14
	i32 1968388702, ; 105: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 36
	i32 2003115576, ; 106: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 6
	i32 2019465201, ; 107: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 62
	i32 2045470958, ; 108: System.Private.Xml => 0x79eb68ee => 97
	i32 2055257422, ; 109: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 61
	i32 2066184531, ; 110: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 5
	i32 2079903147, ; 111: System.Runtime.dll => 0x7bf8cdab => 100
	i32 2090596640, ; 112: System.Numerics.Vectors => 0x7c9bf920 => 94
	i32 2127167465, ; 113: System.Console => 0x7ec9ffe9 => 84
	i32 2159891885, ; 114: Microsoft.Maui => 0x80bd55ad => 46
	i32 2169148018, ; 115: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 13
	i32 2181898931, ; 116: Microsoft.Extensions.Options.dll => 0x820d22b3 => 42
	i32 2192057212, ; 117: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 41
	i32 2193016926, ; 118: System.ObjectModel.dll => 0x82b6c85e => 95
	i32 2201107256, ; 119: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 76
	i32 2201231467, ; 120: System.Net.Http => 0x8334206b => 91
	i32 2207618523, ; 121: it\Microsoft.Maui.Controls.resources => 0x839595db => 15
	i32 2266799131, ; 122: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 37
	i32 2279755925, ; 123: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 69
	i32 2303942373, ; 124: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 19
	i32 2305521784, ; 125: System.Private.CoreLib.dll => 0x896b7878 => 109
	i32 2353062107, ; 126: System.Net.Primitives => 0x8c40e0db => 92
	i32 2366048013, ; 127: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 13
	i32 2368005991, ; 128: System.Xml.ReaderWriter.dll => 0x8d24e767 => 107
	i32 2371007202, ; 129: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 36
	i32 2395872292, ; 130: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 14
	i32 2427813419, ; 131: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 11
	i32 2435356389, ; 132: System.Console.dll => 0x912896e5 => 84
	i32 2475788418, ; 133: Java.Interop.dll => 0x93918882 => 110
	i32 2480646305, ; 134: Microsoft.Maui.Controls => 0x93dba8a1 => 44
	i32 2503351294, ; 135: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 17
	i32 2550873716, ; 136: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 12
	i32 2570120770, ; 137: System.Text.Encodings.Web => 0x9930ee42 => 102
	i32 2576534780, ; 138: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 16
	i32 2593496499, ; 139: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 21
	i32 2605712449, ; 140: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 76
	i32 2617129537, ; 141: System.Private.Xml.dll => 0x9bfe3a41 => 97
	i32 2620871830, ; 142: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 56
	i32 2626831493, ; 143: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 16
	i32 2639913880, ; 144: SoftwareSystemOrders.resources => 0x9d59e398 => 0
	i32 2655094246, ; 145: SoftwareSystemOrders.resources.dll => 0x9e4185e6 => 0
	i32 2663698177, ; 146: System.Runtime.Loader => 0x9ec4cf01 => 99
	i32 2693969371, ; 147: SoftwareSystemOrders => 0xa092b5db => 77
	i32 2732626843, ; 148: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2737747696, ; 149: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2740698338, ; 150: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 2
	i32 2752995522, ; 151: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 22
	i32 2758225723, ; 152: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 45
	i32 2764765095, ; 153: Microsoft.Maui.dll => 0xa4caf7a7 => 46
	i32 2778768386, ; 154: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 72
	i32 2785988530, ; 155: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 28
	i32 2801831435, ; 156: Microsoft.Maui.Graphics => 0xa7008e0b => 48
	i32 2810250172, ; 157: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 54
	i32 2853208004, ; 158: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 72
	i32 2861189240, ; 159: Microsoft.Maui.Essentials => 0xaa8a4878 => 47
	i32 2909740682, ; 160: System.Private.CoreLib => 0xad6f1e8a => 109
	i32 2916838712, ; 161: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 73
	i32 2919462931, ; 162: System.Numerics.Vectors.dll => 0xae037813 => 94
	i32 2959614098, ; 163: System.ComponentModel.dll => 0xb0682092 => 83
	i32 2978675010, ; 164: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 58
	i32 3038032645, ; 165: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 35
	i32 3053864966, ; 166: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 8
	i32 3057625584, ; 167: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 65
	i32 3059408633, ; 168: Mono.Android.Runtime => 0xb65adef9 => 111
	i32 3059793426, ; 169: System.ComponentModel.Primitives => 0xb660be12 => 81
	i32 3178803400, ; 170: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 66
	i32 3220365878, ; 171: System.Threading => 0xbff2e236 => 106
	i32 3258312781, ; 172: Xamarin.AndroidX.CardView => 0xc235e84d => 52
	i32 3305363605, ; 173: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 8
	i32 3316684772, ; 174: System.Net.Requests.dll => 0xc5b097e4 => 93
	i32 3317135071, ; 175: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 57
	i32 3346324047, ; 176: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 67
	i32 3357674450, ; 177: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 25
	i32 3358260929, ; 178: System.Text.Json => 0xc82afec1 => 103
	i32 3362522851, ; 179: Xamarin.AndroidX.Core => 0xc86c06e3 => 55
	i32 3366347497, ; 180: Java.Interop => 0xc8a662e9 => 110
	i32 3374999561, ; 181: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 69
	i32 3381016424, ; 182: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 4
	i32 3428513518, ; 183: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 38
	i32 3458724246, ; 184: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 23
	i32 3471940407, ; 185: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 82
	i32 3476120550, ; 186: Mono.Android => 0xcf3163e6 => 112
	i32 3484440000, ; 187: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 24
	i32 3485117614, ; 188: System.Text.Json.dll => 0xcfbaacae => 103
	i32 3580758918, ; 189: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 32
	i32 3592228221, ; 190: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 34
	i32 3608519521, ; 191: System.Linq.dll => 0xd715a361 => 89
	i32 3641597786, ; 192: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 61
	i32 3643446276, ; 193: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 29
	i32 3643854240, ; 194: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 66
	i32 3657292374, ; 195: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 37
	i32 3672681054, ; 196: Mono.Android.dll => 0xdae8aa5e => 112
	i32 3724971120, ; 197: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 65
	i32 3748608112, ; 198: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 85
	i32 3751619990, ; 199: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 4
	i32 3786282454, ; 200: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 53
	i32 3792276235, ; 201: System.Collections.NonGeneric => 0xe2098b0b => 79
	i32 3823082795, ; 202: System.Security.Cryptography.dll => 0xe3df9d2b => 101
	i32 3841636137, ; 203: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 39
	i32 3849253459, ; 204: System.Runtime.InteropServices.dll => 0xe56ef253 => 98
	i32 3896106733, ; 205: System.Collections.Concurrent.dll => 0xe839deed => 78
	i32 3896760992, ; 206: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 55
	i32 3920221145, ; 207: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 20
	i32 3928044579, ; 208: System.Xml.ReaderWriter => 0xea213423 => 107
	i32 3931092270, ; 209: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 68
	i32 3955647286, ; 210: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 4025784931, ; 211: System.Memory => 0xeff49a63 => 90
	i32 4046471985, ; 212: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 45
	i32 4055525314, ; 213: SoftwareSystemOrders.dll => 0xf1ba67c2 => 77
	i32 4073602200, ; 214: System.Threading.dll => 0xf2ce3c98 => 106
	i32 4091086043, ; 215: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 6
	i32 4094352644, ; 216: Microsoft.Maui.Essentials.dll => 0xf40add04 => 47
	i32 4100113165, ; 217: System.Private.Uri => 0xf462c30d => 96
	i32 4103439459, ; 218: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 30
	i32 4126470640, ; 219: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 38
	i32 4150914736, ; 220: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 30
	i32 4182413190, ; 221: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 63
	i32 4213026141, ; 222: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 85
	i32 4249188766, ; 223: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 19
	i32 4271975918, ; 224: Microsoft.Maui.Controls.dll => 0xfea12dee => 44
	i32 4292120959 ; 225: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 63
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [226 x i32] [
	i32 1, ; 0
	i32 10, ; 1
	i32 105, ; 2
	i32 34, ; 3
	i32 48, ; 4
	i32 18, ; 5
	i32 98, ; 6
	i32 33, ; 7
	i32 26, ; 8
	i32 53, ; 9
	i32 71, ; 10
	i32 83, ; 11
	i32 31, ; 12
	i32 49, ; 13
	i32 9, ; 14
	i32 60, ; 15
	i32 105, ; 16
	i32 90, ; 17
	i32 35, ; 18
	i32 29, ; 19
	i32 80, ; 20
	i32 59, ; 21
	i32 108, ; 22
	i32 7, ; 23
	i32 95, ; 24
	i32 43, ; 25
	i32 28, ; 26
	i32 40, ; 27
	i32 57, ; 28
	i32 20, ; 29
	i32 102, ; 30
	i32 78, ; 31
	i32 99, ; 32
	i32 93, ; 33
	i32 87, ; 34
	i32 26, ; 35
	i32 42, ; 36
	i32 96, ; 37
	i32 86, ; 38
	i32 11, ; 39
	i32 25, ; 40
	i32 81, ; 41
	i32 22, ; 42
	i32 15, ; 43
	i32 60, ; 44
	i32 24, ; 45
	i32 80, ; 46
	i32 70, ; 47
	i32 39, ; 48
	i32 50, ; 49
	i32 5, ; 50
	i32 88, ; 51
	i32 62, ; 52
	i32 82, ; 53
	i32 75, ; 54
	i32 108, ; 55
	i32 27, ; 56
	i32 21, ; 57
	i32 17, ; 58
	i32 23, ; 59
	i32 67, ; 60
	i32 3, ; 61
	i32 58, ; 62
	i32 12, ; 63
	i32 89, ; 64
	i32 32, ; 65
	i32 33, ; 66
	i32 70, ; 67
	i32 54, ; 68
	i32 1, ; 69
	i32 7, ; 70
	i32 87, ; 71
	i32 51, ; 72
	i32 43, ; 73
	i32 86, ; 74
	i32 31, ; 75
	i32 104, ; 76
	i32 64, ; 77
	i32 73, ; 78
	i32 56, ; 79
	i32 91, ; 80
	i32 104, ; 81
	i32 100, ; 82
	i32 74, ; 83
	i32 92, ; 84
	i32 101, ; 85
	i32 52, ; 86
	i32 2, ; 87
	i32 71, ; 88
	i32 40, ; 89
	i32 111, ; 90
	i32 18, ; 91
	i32 59, ; 92
	i32 10, ; 93
	i32 64, ; 94
	i32 75, ; 95
	i32 74, ; 96
	i32 68, ; 97
	i32 41, ; 98
	i32 27, ; 99
	i32 88, ; 100
	i32 9, ; 101
	i32 3, ; 102
	i32 79, ; 103
	i32 14, ; 104
	i32 36, ; 105
	i32 6, ; 106
	i32 62, ; 107
	i32 97, ; 108
	i32 61, ; 109
	i32 5, ; 110
	i32 100, ; 111
	i32 94, ; 112
	i32 84, ; 113
	i32 46, ; 114
	i32 13, ; 115
	i32 42, ; 116
	i32 41, ; 117
	i32 95, ; 118
	i32 76, ; 119
	i32 91, ; 120
	i32 15, ; 121
	i32 37, ; 122
	i32 69, ; 123
	i32 19, ; 124
	i32 109, ; 125
	i32 92, ; 126
	i32 13, ; 127
	i32 107, ; 128
	i32 36, ; 129
	i32 14, ; 130
	i32 11, ; 131
	i32 84, ; 132
	i32 110, ; 133
	i32 44, ; 134
	i32 17, ; 135
	i32 12, ; 136
	i32 102, ; 137
	i32 16, ; 138
	i32 21, ; 139
	i32 76, ; 140
	i32 97, ; 141
	i32 56, ; 142
	i32 16, ; 143
	i32 0, ; 144
	i32 0, ; 145
	i32 99, ; 146
	i32 77, ; 147
	i32 49, ; 148
	i32 51, ; 149
	i32 2, ; 150
	i32 22, ; 151
	i32 45, ; 152
	i32 46, ; 153
	i32 72, ; 154
	i32 28, ; 155
	i32 48, ; 156
	i32 54, ; 157
	i32 72, ; 158
	i32 47, ; 159
	i32 109, ; 160
	i32 73, ; 161
	i32 94, ; 162
	i32 83, ; 163
	i32 58, ; 164
	i32 35, ; 165
	i32 8, ; 166
	i32 65, ; 167
	i32 111, ; 168
	i32 81, ; 169
	i32 66, ; 170
	i32 106, ; 171
	i32 52, ; 172
	i32 8, ; 173
	i32 93, ; 174
	i32 57, ; 175
	i32 67, ; 176
	i32 25, ; 177
	i32 103, ; 178
	i32 55, ; 179
	i32 110, ; 180
	i32 69, ; 181
	i32 4, ; 182
	i32 38, ; 183
	i32 23, ; 184
	i32 82, ; 185
	i32 112, ; 186
	i32 24, ; 187
	i32 103, ; 188
	i32 32, ; 189
	i32 34, ; 190
	i32 89, ; 191
	i32 61, ; 192
	i32 29, ; 193
	i32 66, ; 194
	i32 37, ; 195
	i32 112, ; 196
	i32 65, ; 197
	i32 85, ; 198
	i32 4, ; 199
	i32 53, ; 200
	i32 79, ; 201
	i32 101, ; 202
	i32 39, ; 203
	i32 98, ; 204
	i32 78, ; 205
	i32 55, ; 206
	i32 20, ; 207
	i32 107, ; 208
	i32 68, ; 209
	i32 50, ; 210
	i32 90, ; 211
	i32 45, ; 212
	i32 77, ; 213
	i32 106, ; 214
	i32 6, ; 215
	i32 47, ; 216
	i32 96, ; 217
	i32 30, ; 218
	i32 38, ; 219
	i32 30, ; 220
	i32 63, ; 221
	i32 85, ; 222
	i32 19, ; 223
	i32 44, ; 224
	i32 63 ; 225
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
